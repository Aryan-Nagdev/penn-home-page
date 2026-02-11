#!/usr/bin/env bash

echo "🚀 Running Laravel deploy script..."

# Install dependencies
composer install --no-dev --optimize-autoloader

# Generate app key if not set
if [ -z "$APP_KEY" ]; then
  php artisan key:generate
fi

# Run migrations
php artisan migrate --force

# Cache configs for performance
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "✅ Laravel setup complete!"
