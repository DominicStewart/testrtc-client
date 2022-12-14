#!/bin/bash -e

# Setup
set -o allexport; source .env; set +o allexport

npm run netlify-config-redirect

# Configure exit trap
function cleanup()
{
   cp -f netlify.toml.bak netlify.toml
}

trap cleanup EXIT

# Build and run
npm run build
npx netlify dev
