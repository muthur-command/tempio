# tempio

一个用于 Docker 镜像的模板工具，基于 [text/template](https://golang.org/pkg/text/template/)（Go 模板引擎）并支持 [Sprig](http://masterminds.github.io/sprig/)。本工具属于 **Muthur Command** 工具链，用于 **Muthur Command OS** 镜像与插件构建中的配置模板渲染。

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

## 来源

- **上游：** 本仓库移植自 [home-assistant/tempio](https://github.com/home-assistant/tempio)，上游项目用于原 Home Assistant 生态中的容器配置模板场景。
- **本仓库：** **Muthur Command** 在此维护该分支，供 **Muthur Command OS** 的 CI 与镜像使用；行为与发布标签可能随时间与上游产生差异。
- **许可：** 自上游继承的代码仍为 **Apache-2.0**；见 [`LICENSE`](./LICENSE)。
