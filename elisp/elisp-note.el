(message "Hello world!")
(concat "hell" "o world!")
(substring "I love you" 2 6)

(defun 圆面积 (半径)
  "用给定的参数做半径，计算圆面积。"
  (let ((圆周率 3.1415926)
        面积)
    (setq 面积 (* 圆周率 半径 半径))
    (message "半径为 %.2f 的圆面积是 %.2f" 半径 面积)))
(圆面积 3)
