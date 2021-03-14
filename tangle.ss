#!/usr/bin/env gxi
(import :std/misc/process)
  ;; # Change to where this file lives
  ;;  cd "$(dirname "$0")"

(def srcdir (path-normalize (path-directory (this-source-file))))

(def source-of-source '("README.org" "doc/pgpass.org" "doc/connect.org" "doc/gerbil-package.org"))

;; # Use Emacs to tangle the files.
;;    tangle() {
;;        emacs --batch -l org --eval "(org-babel-tangle-file \"$1\")"
;;    }

(def (tangle srcdir file)
  (display
   (run-process ["emacs" "--batch" "-l" "org" "--eval"
                 (string-append" (print (org-babel-tangle-file \""file"\"))")]
                directory: srcdir)))

;; # Tangle the files!

(for-each (cut tangle srcdir <>) source-of-source)
