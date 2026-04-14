# tempio

一个用于 Docker 镜像的模板工具，基于 [text/template](https://golang.org/pkg/text/template/)（Golang 模板引擎）并支持 [sprig functions](http://masterminds.github.io/sprig/)。

支持的配置格式：

- json

## 基础示例

```bash
tempio \
    -conf /config/coredns.json \
    -template /usr/share/tempio/corefile \
    -out /etc/corefile
```

## 管道输入示例

```bash
echo '{"some": "value"}' | tempio \
    -template /usr/share/tempio/corefile \
    -out /etc/corefile
```

## 不指定输出文件示例

_当未传入 `-out` 参数时，结果会直接输出到控制台。_

```bash
$ echo '{"some": "value"}' | tempio \
    -template /usr/share/tempio/corefile
> {"some": "value", "other": "value"}
```

## 在 GitHub Actions 中使用 tempio

```yaml
- name: Setup tempio
  uses: muthur-command/tempio@main
- name: Run tempio
  run: tempio -help
```
