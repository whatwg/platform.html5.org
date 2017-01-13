#!/bin/bash
(for file in index.html specs/index.html history/index.html; do
  echo "Checking $file...";
  curl -s -H "Content-Type: text/html; charset=utf-8" \
    --data-binary @$file https://checker.html5.org/?out=gnu\&file=$file \
  | tee -a OUTPUT;
  echo;
done;)
if [ -s OUTPUT ]; then exit 1; fi
