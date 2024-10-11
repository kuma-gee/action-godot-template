# Godot Template

Build the godot template with an encryption key

## Inputs

### `platform`

**Required** The platform to build the template. Currently supported: `windows`, `linux`

### `version`

**Required** The godot version to use

### `encryption-key`

**Required** The encryption key to use. If this is not needed, you can just use the official templates from godot.

## Example usage

```yml
uses: kuma-gee/action-godot-template@main
with:
    version: 4.3
    platform: linux
    encryption-key: <ENCRYPTION_KEY>
```

See `.github/workflows/godot-template-build.yml` for a full workflow that builds the template and uploads it to github as a release.