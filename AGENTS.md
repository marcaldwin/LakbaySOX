

# AGENTS.md — LakbaySOX

## Goals
- Clean lints and formatting, extract reusable UI, keep behavior the same.
- Improve list/map performance; keep routing/state intact.

## How to run
- `flutter pub get`
- `dart format . && dart fix --apply && flutter analyze`
- Build: `flutter run`

## Structure hints
- Entry: `lib/main.dart`
- Router: `lib/app/router.dart` (or actual path)
- Features under `lib/features/*/{presentation,domain,data}`
- Shared UI in `lib/common/widgets`

## Style
- Flutter lints (`analysis_options.yaml`).
- Prefer `const`, `final`, small widgets, tidy imports.

## Do NOT
- Break routes or change APIs without a note.
- Add heavy deps without approval.
