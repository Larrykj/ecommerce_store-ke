# Deployment Guide

## Security Setup for Production

### 1. Generate New Encryption Keys

**IMPORTANT:** Never use development keys in production!

```bash
# Generate ActiveRecord encryption keys
bundle exec rails db:encryption:init

# Generate Lockbox master key
bundle exec rails runner "puts Lockbox.generate_key"
```

### 2. Configure Rails Credentials

Add the generated keys to your Rails credentials:

```bash
EDITOR="nano" bundle exec rails credentials:edit
```

Add this structure:
```yaml
active_record_encryption:
  primary_key: <your_generated_primary_key>
  deterministic_key: <your_generated_deterministic_key>
  key_derivation_salt: <your_generated_salt>

lockbox:
  master_key: <your_generated_lockbox_key>
```

### 3. Environment Variables (Alternative to Credentials)

If using environment variables instead of credentials, set these:

```bash
export ACTIVE_RECORD_PRIMARY_KEY="<your_key>"
export ACTIVE_RECORD_DETERMINISTIC_KEY="<your_key>"
export ACTIVE_RECORD_KEY_DERIVATION_SALT="<your_salt>"
export LOCKBOX_MASTER_KEY="<your_key>"
```

### 4. Database Setup

```bash
bundle exec rails db:create RAILS_ENV=production
bundle exec rails db:migrate RAILS_ENV=production
```

### 5. Asset Precompilation

```bash
bundle exec rails assets:precompile RAILS_ENV=production
```

### 6. Run Server

```bash
bundle exec rails server -e production
```

## Security Checklist

- ✅ All encryption keys stored in credentials or environment variables
- ✅ `config/master.key` added to `.gitignore`
- ✅ No hardcoded secrets in codebase
- ✅ SSL/HTTPS enforced in production
- ✅ Rate limiting enabled (Rack::Attack)
- ✅ Secure session cookies configured
- ✅ Security headers set
- ✅ Database credentials secured

## CI/CD Pipeline Requirements

### Required Environment Variables

Set these in your CI/CD platform (GitHub Actions, GitLab CI, etc.):

```
RAILS_MASTER_KEY=<your_master_key_from_config/master.key>
DATABASE_URL=<your_production_database_url>
```

### GitHub Actions Example

```yaml
name: CI/CD Pipeline

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: 4.0.0
          bundler-cache: true
      
      - name: Setup Database
        env:
          RAILS_ENV: test
          DATABASE_URL: postgresql://postgres:postgres@localhost/test
        run: |
          bundle exec rails db:create
          bundle exec rails db:migrate
      
      - name: Run Tests
        env:
          RAILS_ENV: test
        run: bundle exec rails test
      
      - name: Security Audit
        run: |
          bundle exec brakeman -q -z
          bundle exec bundle-audit check --update
```

## Production Deployment Platforms

### Heroku
```bash
heroku config:set RAILS_MASTER_KEY=<your_key>
git push heroku main
```

### Railway/Render
Add `RAILS_MASTER_KEY` to environment variables in dashboard.

### Docker
Mount `config/master.key` as a secret or pass as environment variable.
