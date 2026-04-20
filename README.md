# The `leipzig-university-slides` Package
<div align="center">Version 0.1.0</div>

> This theme is **NOT** an official theme of Leipzig University.

**leipzig-university-slides** is a [Polylux](https://github.com/polylux-typ/polylux) theme for creating presentation slides in [Typst](https://github.com/typst/typst). It is inspired by the presentation template provided by [Leipzig University](https://www.uni-leipzig.de/). This an **unofficial** theme and is not affiliated with Leipzig University.

## Template adaptation checklist

- [x] Fill out `README.md`
  - Change the `my-package` package name, including code snippets
  - Check section contents and/or delete sections that don't apply
- [x] Check and/or replace `LICENSE` by something that suits your needs
- [x] Fill out `typst.toml`
  - See also the [typst/packages README](https://github.com/typst/packages/?tab=readme-ov-file#package-format)
- [x] Adapt Repository URLs in `CHANGELOG.md`
  - Consider only committing that file with your first release, or removing the "Initial Release" part in the beginning
- [ ] Adapt or deactivate the release workflow in `.github/workflows/release.yml`
  - to deactivate it, delete that file or remove/comment out lines 2-4 (`on:` and following)
  - to use the workflow
    - [x] check the values under `env:`, particularly `REGISTRY_FORK`
    - [x] if you don't have one, [create a fine-grained personal access token](https://github.com/settings/tokens?type=beta) with [only Contents permission](https://stackoverflow.com/a/75116350/371191) for the `REGISTRY_FORK`
    - [x] on this repo, create a secret `REGISTRY_TOKEN` (at `https://github.com/[user]/[repo]/settings/secrets/actions`) that contains the so created token

    if configured correctly, whenever you create a tag `v...`, your package will be pushed onto a branch on the `REGISTRY_FORK`, from which you can then create a pull request against [typst/packages](https://github.com/typst/packages/)
- [ ] remove/replace the example test case
- [ ] (add your actual code, docs and tests)
- [ ] remove this section from the README

## Getting Started

These instructions will get you a copy of the project up and running on the typst web app. Perhaps a short code example on importing the package and a very simple teaser usage.

```typ
#import "@preview/leipzig-university-slides:0.1.0": *

#show: leipzig-theme.with(
  title: [Title of the presentation],
  author: ("Your Name",),
  subtitle: "Seminar title (e.g. Group seminar)",
  short-title: "Short title",
  date: datetime(year: 2026, month: 4, day: 19),
)

#title-slide(
  extra: [
    Institute of Computer Science\
    Faculty of Mathematics and Computer Science\
    Leipzig University
  ]
)
```

<picture>
  <img src="./thumbnail.svg">
</picture>

### Installation

A step by step guide that will tell you how to get the development environment up and running. This should explain how to clone the repo and where to (maybe a link to the typst documentation on it), along with any pre-requisite software and installation steps.

```
$ First step
$ Another step
$ Final step
```

## Usage

A more in-depth description of usage. Any template arguments? A complicated example that showcases most if not all of the functions the package provides? This is also an excellent place to signpost the manual.

```typ
#import "@preview/my-package:0.1.0": *

#let my-complicated-example = ...
```

## Additional Documentation and Acknowledgments

* inspired by [Leipzig Beamer Template](https://github.com/bmondal94/Leipzig-Beamer-Template) created by [Badal Mondal](https://github.com/bmondal94)
* created with [typst-package-template](https://github.com/typst-community/typst-package-template)
