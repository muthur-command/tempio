#!/usr/bin/env bash
# Bump pinned tempio release in a downstream MCOS repository checkout.
#
# Usage: bump-downstream-tempio-pin.sh <repo-name> <checkout-root> <version>
#   repo-name: docker-base | operating-system | addons
#   version: GitHub release tag (mc_ prefix is stripped for pin values)

set -euo pipefail

REPO="${1:?repo name required}"
ROOT="${2:?checkout root required}"
VER="${3:?version required}"
VER="${VER#mc_}"

log() { echo "[bump-downstream-tempio-pin] $*"; }

case "${REPO}" in
  docker-base)
    for df in alpine/Dockerfile debian/Dockerfile ubuntu/Dockerfile; do
      f="${ROOT}/${df}"
      [[ -f "${f}" ]] || {
        log "missing ${f}"
        exit 1
      }
      sed -i -E "s/^ARG TEMPIO_VERSION=.*/ARG TEMPIO_VERSION=${VER}/" "${f}"
      log "updated ${df}"
    done
    ;;
  operating-system)
    f="${ROOT}/buildroot-external/package/tempio/tempio.mk"
    [[ -f "${f}" ]] || {
      log "missing ${f}"
      exit 1
    }
    sed -i -E "s/^TEMPIO_VERSION = .*/TEMPIO_VERSION = ${VER}/" "${f}"
    log "updated tempio.mk"
    ;;
  addons)
    f="${ROOT}/matter_server/build.yaml"
    [[ -f "${f}" ]] || {
      log "missing ${f}"
      exit 1
    }
    sed -i -E "s/^  TEMPIO_VERSION: .*/  TEMPIO_VERSION: ${VER}/" "${f}"
    log "updated matter_server/build.yaml"
    ;;
  *)
    log "unknown repo: ${REPO}"
    exit 1
    ;;
esac
