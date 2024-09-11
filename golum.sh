#!/bin/bash

# Jekyll Blog Setup Script

set -e

echo "Setting up your Jekyll blog with headless CMS, Docker, and Netlify..."

# Step 1: Create a new Jekyll site
echo "Creating new Jekyll site..."
jekyll new golum3
cd golum3

# Step 2: Set up Git repository
echo "Initializing Git repository..."
git init
git add .
git commit -m "Initial commit"

# Step 3: Create Dockerfile
echo "Creating Dockerfile..."
cat << EOF > Dockerfile
FROM jekyll/jekyll:4.2.0
WORKDIR /srv/jekyll
COPY . .
RUN bundle install
CMD ["jekyll", "serve", "--force_polling", "-H", "0.0.0.0"]
EOF

# Step 4: Create docker-compose.yml
echo "Creating docker-compose.yml..."
cat << EOF > docker-compose.yml
version: '3'
services:
  site:
    command: jekyll serve --force_polling
    image: jekyll/jekyll:4.2.0
    volumes:
      - .:/srv/jekyll
    ports:
      - 4000:4000
EOF

# Step 5: Set up Netlify CMS
echo "Setting up Netlify CMS..."
mkdir -p admin
cat << EOF > admin/config.yml
backend:
  name: git-gateway
  branch: main
media_folder: "assets/uploads"
collections:
  - name: "blog"
    label: "Blog"
    folder: "_posts"
    create: true
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}"
    fields:
      - {label: "Layout", name: "layout", widget: "hidden", default: "post"}
      - {label: "Title", name: "title", widget: "string"}
      - {label: "Publish Date", name: "date", widget: "datetime"}
      - {label: "Body", name: "body", widget: "markdown"}
EOF

cat << EOF > admin/index.html
<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Content Manager</title>
</head>
<body>
  <script src="https://unpkg.com/netlify-cms@^2.0.0/dist/netlify-cms.js"></script>
</body>
</html>
EOF

# Step 6: Create .ruby-version file
echo "Creating .ruby-version file..."
echo "3.0.0" > .ruby-version



# Step 8: Build and run Docker container
echo "Building and running Docker container..."
docker-compose up -d

# Step 9: Netlify setup
echo "Setting up Netlify..."
netlify init

# Step 10: Push to GitHub (assumes you've created a repo)
echo "Please enter your GitHub repository URL:"
read repo_url
git remote add origin $repo_url
git push -u origin main

echo "Setup complete! Your blog is now running locally and set up for Netlify deployment."
echo "Next steps:"
echo "1. Visit http://localhost:4000 to view your blog locally."
echo "2. Use the Netlify CMS at http://localhost:4000/admin to manage content."
echo "3. Edit files directly in your preferred code editor."
echo "4. Commit and push changes to trigger Netlify deployment."
