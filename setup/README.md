# Setup Templates

Setup default godot templates and optionally custom templates with an encryption key

## Inputs

### `version`

**Required** The godot version to use

### `game-folder`

The folder of the godot project. It will configure the export settings to use the
custom template. Defaults to current folder

### `channel`

The export channel to setup the custom templates for: `windows`, `linux` or `web`

### `encryption-key`

The encryption key to use. If this is not needed, you can just use the official templates from godot.

## Example usage

```yml
name: Setup Templates
uses: kuma-gee/action-godot-template/setup@v1
with:
    version: 4.3
    channel: windows
    encryption-key: SECRET_KEY
    game-folder: .
```

See `.github/workflows/godot-template-build.yml` for a full workflow that builds the template and uploads it to github as a release.