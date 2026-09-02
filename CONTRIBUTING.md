# Contributing

Thank you for contributing to the WAB 2D Platformer Template.

## Important: license and access

This repository is **All Rights Reserved** (see [LICENSE](LICENSE)). Contribution guidelines here apply to **invited collaborators** working with Tiger Studio / Wab. Do not assume you may fork, redistribute, or reuse project assets outside the scope agreed with the studio.

If you are not an invited collaborator, contact the maintainers before submitting changes.

## Code of conduct

Participation is governed by [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Development setup

1. Clone the repository (see [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md)).
2. Open the project in Godot **4.7+**.
3. Run the optional validation script:

```bash
godot --headless --path . --script res://tests/validate_load.gd
```

## Branching

- Base branch: `main`
- Feature branches: `feature/<short-description>`
- Bug fixes: `fix/<short-description>`

Keep pull requests focused on one concern.

## GDScript style

- Use typed GDScript where practical (`var speed: float = 220.0`)
- Prefer `@export` for designer-tunable gameplay values
- Use Input Map actions; do not hardcode key constants in gameplay code
- Match existing indentation (tabs for `.gd` files)
- Add brief doc comments on public-facing autoload APIs and reusable classes

## Scene and asset guidelines

- Keep scenes small and composable
- Co-locate scripts with their primary scene when possible
- Place new gameplay actors under `entities/`
- Place new levels under `levels/`
- Do not commit `.godot/` editor cache or export binaries

## Pull request checklist

- [ ] Project opens in Godot 4.7 without errors
- [ ] Main menu → game → pause → resume flow works
- [ ] Player can run, jump, and land on ground and one-way platforms
- [ ] No unrelated files included (OS junk, local editor settings, secrets)
- [ ] Docs updated if folder layout, controls, or architecture changed

## Commit messages

Use clear, imperative subject lines:

- `Add double-jump prototype to player controller`
- `Fix pause menu input when tree is paused`
- `Document physics layer setup in ARCHITECTURE.md`

## Reporting issues

Use GitHub Issues with the provided templates:

- Bug reports: include Godot version, OS, reproduction steps, expected vs actual behavior
- Feature requests: describe the problem first, then the proposed solution

## Security

Do not open public issues for security vulnerabilities. See [SECURITY.md](SECURITY.md).

## Questions

Open a GitHub Issue with the **Question** label or contact the Tiger Studio maintainers directly.
