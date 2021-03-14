#!/usr/bin/env gxi
;; -*- Gerbil -*-

(import :std/build-script)

(defbuild-script
  '("pg/pgpass" "pg/connect") verbose: 5)
