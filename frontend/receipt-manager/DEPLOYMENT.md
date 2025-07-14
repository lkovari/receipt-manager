# Deploying Receipt Manager to Render.com

This guide will help you deploy your Angular application to Render.com using either the Static Site service or Web Service with Docker.

## Prerequisites

1. A Render.com account
2. Your code pushed to a Git repository (GitHub, GitLab, or Bitbucket)
3. Node.js 18+ (for local testing)

## Option 1: Static Site Deployment (Recommended)

### Step 1: Prepare Your Repository

Your repository should already have the necessary configuration files:
- `render.yaml` - Render Blueprint configuration
- `package.json` - Contains the build script

### Step 2: Deploy to Render

1. **Sign in to Render.com** and click "New +"

2. **Select "Blueprint"** from the dropdown

3. **Connect your Git repository**:
   - Choose your Git provider (GitHub, GitLab, or Bitbucket)
   - Select your repository
   - Render will automatically detect the `render.yaml` file

4. **Review and Deploy**:
   - Render will show you the services that will be created
   - Click "Apply" to start the deployment

5. **Monitor the Build**:
   - Render will automatically run `npm install && npm run build-app`
   - The build output will be served from `./dist/receipt-manager`

### Step 3: Access Your App

Once deployment is complete, Render will provide you with a URL like:
`https://your-app-name.onrender.com`

## Option 2: Web Service with Docker

If you prefer to use Docker for more control:

1. **Sign in to Render.com** and click "New +"

2. **Select "Web Service"**

3. **Connect your Git repository**

4. **Configure the service**:
   - **Name**: `receipt-manager`
   - **Environment**: `Docker`
   - **Region**: Choose closest to your users
   - **Branch**: `main` (or your default branch)
   - **Root Directory**: Leave empty (root of repository)
   - **Docker Command**: Leave empty (uses Dockerfile)

5. **Click "Create Web Service"**

## Environment Variables (Optional)

If your app needs environment variables:

1. Go to your service dashboard on Render
2. Navigate to "Environment" tab
3. Add any required environment variables

## Custom Domain (Optional)

To use a custom domain:

1. Go to your service dashboard
2. Navigate to "Settings" tab
3. Click "Add Custom Domain"
4. Follow the DNS configuration instructions

## Automatic Deployments

Render automatically deploys your app when you push changes to your connected branch. You can:

- **Disable auto-deploy** in the service settings
- **Set up preview environments** for pull requests
- **Configure deployment notifications** via Slack

## Troubleshooting

### Build Failures

1. **Check build logs** in the Render dashboard
2. **Verify Node.js version** - your app uses Node 18+
3. **Check for missing dependencies** in package.json

### Routing Issues

If you experience routing problems:
- The `render.yaml` includes a rewrite rule for SPA routing
- The nginx configuration handles client-side routing

### Performance Optimization

The configuration includes:
- Gzip compression
- Static asset caching
- Security headers
- Optimized nginx configuration

## Local Testing

Before deploying, test your build locally:

```bash
# Install dependencies
npm install

# Build the application
npm run build-app

# Test the build (requires a local server)
npx serve dist/receipt-manager
```

## Support

- [Render Documentation](https://render.com/docs)
- [Angular Deployment Guide](https://angular.io/guide/deployment)
- [Render Community](https://community.render.com/) 