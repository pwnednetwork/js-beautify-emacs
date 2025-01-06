;;; js-beautify.el -- beautify some js code
;; created from https://sethmason.com/2011/04/28/beautify-your-javascript-in-emacs.html

(defgroup js-beautify nil
  "Use jsbeautify to beautify some js"
  :group 'editing)

(defcustom js-beautify-args "--jslint-happy --brace-style=end-expand
--keep-array-indentation"
  "Arguments to pass to jsbeautify script"
  :type '(string)
  :group 'js-beautify)


(defun js-beautify ()
  "Beautify a region of javascript using js-beautify"
  (interactive)
  (let ((orig-point (point)))
    (unless (mark)
      (mark-defun))
    (shell-command-on-region (point)
                            (mark)
                            (concat "js-beautify -f - "  ; Added -f - for stdin
                                    js-beautify-args)
                            nil t)
    (goto-char orig-point)))


(provide 'js-beautify)
;;; js-beautify.el ends here
