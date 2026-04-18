# tempio

A template helper for Docker images, using Go’s [text/template](https://golang.org/pkg/text/template/) engine with [Sprig](http://masterminds.github.io/sprig/) functions. It is part of the **Muthur Command** toolset and is used when building **Muthur Command OS** images and add-ons.

中文文档: [`README.zh-CN.md`](./README.zh-CN.md)

Support conf format:

- json

## Basic Example

```bash
tempio \
    -conf /config/coredns.json \
    -template /usr/share/tempio/corefile \
    -out /etc/corefile
```

## Pipe Example

```bash
echo '{"some": "value"}' | tempio \
    -template /usr/share/tempio/corefile \
    -out /etc/corefile
```

## No Outfile Example

_When  `-out` is not supplied, the result is printed to the console._

```bash
$ echo '{"some": "value"}' | tempio \
    -template /usr/share/tempio/corefile
> {"some": "value", "other": "value"}
```

## Add tempio to your GitHub actions

```yaml
- name: Setup tempio
  uses: muthur-command/tempio@main
- name: Run tempio
  run: tempio -help
```

## Origin

- **Upstream:** This repository was ported from [home-assistant/tempio](https://github.com/home-assistant/tempio), the upstream template helper used in Home Assistant–related container workflows.
- **In this repo:** **Muthur Command** maintains this fork for **Muthur Command OS** CI and images; behavior and release tags may diverge from upstream over time.
- **License:** Code inherited from upstream remains **Apache-2.0**; see [`LICENSE`](./LICENSE).
