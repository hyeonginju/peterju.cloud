#!/bin/bash
# jaspr serve를 자체 프로세스 그룹으로 실행하고, 이 스크립트가 종료될 때
# build_runner 데몬 등 자식 프로세스까지 함께 정리한다.
set -m

jaspr serve "$@" &
JASPR_PID=$!

cleanup() {
  kill -TERM -"$JASPR_PID" 2>/dev/null
  kill -TERM "$JASPR_PID" 2>/dev/null
}
trap cleanup EXIT INT TERM

wait "$JASPR_PID"
