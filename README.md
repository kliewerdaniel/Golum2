# Golum

This is a Jekyll-based blog with Netlify CMS integration, containerized with Docker, and deployed on Netlify.

## Features

- Jekyll static site generator
- Netlify CMS for content management
- Docker containerization for easy local development
- Netlify deployment for continuous integration and delivery

## Prerequisites

- Docker and Docker Compose
- Ruby 3.0.0
- Netlify CLI
- Git

## Getting Started

1. Clone this repository:

git clone https://github.com/kliewerdaniel/golum2.git cd golum3

2. Build and run the Docker container:

docker-compose up -d

3. Visit `http://localhost:4000` to view your blog locally.

4. Access the Netlify CMS at `http://localhost:4000/admin` to manage content.

## Development

- Edit files directly in your preferred code editor.
- Jekyll will automatically rebuild the site when changes are detected.
- Commit and push changes to trigger Netlify deployment.

## Deployment

This blog is set up for automatic deployment on Netlify. Any changes pushed to the `main` branch will trigger a new build and deployment.

## Customization

- Modify `_config.yml` to change your blog's settings.
- Edit or add templates in the `_layouts` and `_includes` directories.
- Customize styles in the `assets/css` directory.

## Adding Content

1. Use the Netlify CMS interface at `/admin` to create and edit blog posts.
2. Alternatively, add Markdown files to the `_posts` directory following the naming convention: `YYYY-MM-DD-title.md`.

## Troubleshooting

If you encounter any issues with Ruby versions or dependencies, ensure that:

1. Your local Ruby version matches the one specified in `.ruby-version` (3.0.0).
2. The Bundler version in `Gemfile.lock` is compatible with Ruby 3.0.0.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).
This README provides a comprehensive overview of your Jekyll blog project, including its features, setup instructions, development workflow, deployment information, and customization options. It also includes sections on adding content, troubleshooting common issues, and information about contributing and licensing.

