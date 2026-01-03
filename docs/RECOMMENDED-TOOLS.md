# Recommended Tools & Extensions

## VS Code Extensions

Essential extensions for Python ML development on Ubuntu.

### Core Python & ML

- **Python (Microsoft)**: The foundation. IntelliSense (Pylance), linting, debugging.
- **Jupyter**: Run notebooks directly in VS Code. Essential for data exploration.
- **Black Formatter**: For consistent code style (`pip install black` required).

### Remote & Infrastructure

- **Remote - SSH**: REQUIRED. Core workflow (LAN only).
- **KDE Connect**: Verification complete for clipboard/input (LAN). File sharing currently troubleshooting.
- **Docker**: Manage containers, images, and registries. Essential for the `nvidia-docker` workflow.
- **YAML**: Syntax highlighting for Dockerfiles, Kubernetes, and config files.

### Cloud Integration

- **Google Cloud Code**: Integrated GCP tools. helpful for managing Vertex AI resources and authentication directly from the IDE.

### AI Assistance

- **GitHub Copilot**: Inline code completion.
- **GitHub Copilot Chat**: Chat interface for coding questions.

## MCP Servers (Model Context Protocol)

Tools to enhance Agentic AI capabilities in this workspace.

### Recommended

- **Postgres MCP**: If your projects involve a local generic database, this allows agents to query schemas and data directly.
- **Filesystem MCP**: (Usually default) Ensures agents can read/write project files.
- **Sequential Thinking**: Helps agents break down complex ML architecture problems.
