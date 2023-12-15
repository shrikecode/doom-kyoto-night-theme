;;; doom-kyoto-night-theme.el --- marriage of Tokyo Night and Nord Theme -*- no-byte-compile: t; -*-
;;; Commentary:
;; Based on the doom one theme (https://github.com/hlissner/emacs-doom-themes)
;; released under the MIT License, copyright (c) 2016-2020 Henrik Lissner
;; and base16-doom by Marcel Arpogaus (https://github.com/MArpogaus/base16-doom)
;; released under the MIT License, (c) 2021 Marcel Arpogaus

;; Authors: Wojciech M. Wnuk <https://github.com/shrikecode>

;; Copyright (c) 2023 Wojciech M. Wnuk

;;; Code:
(require 'doom-themes)
(defgroup doom-kyoto-night-theme nil
  "Options for doom-themes."
  :group 'doom-themes)

(defcustom doom-kyoto-night-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-kyoto-night-theme
  :type 'boolean)

(defcustom doom-kyoto-night-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-kyoto-night-theme
  :type 'boolean)

(defcustom doom-kyoto-night-comment-bg doom-kyoto-night-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their legibility."
  :group 'doom-kyoto-night-theme
  :type 'boolean)

(defcustom doom-kyoto-night-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-kyoto-night-theme
  :type '(choice integer boolean))

    (def-doom-theme doom-kyoto-night
      "A dark theme inspired by Tokyo Night and Nord"
      ;; name        default   256       16
      ((bg         '("#1a1b26" nil       nil            ))
       (bg-alt     `(,(doom-darken (car bg) 0.3) nil       nil            ))
       (base0      `(,(doom-darken (car bg-alt) 0.3) "black"   "black"        ))
       (base1      `(,(doom-darken (car bg-alt) 0.2) "#1e1e1e" "brightblack"  ))
       (base2      `(,(doom-darken (car bg-alt) 0.1) "#2e2e2e" "brightblack"  ))
       (base3      '("#292e42" "#262626" "brightblack"  ))
       (base4      '("#32344a" "#3f3f3f" "brightblack"  ))
       (base5      '("#565f89" "#525252" "brightblack"  ))
       (base6      '("#545c7e" "#6b6b6b" "brightblack"  ))
       (base7      '("#a9b1d6" "#979797" "brightblack"  ))
       (base8      '("#b4f9f8" "#dfdfdf" "white"        ))
       (fg         '("#c0caf5" "#bfbfbf" "brightwhite"  ))
       (fg-alt     '("#565f89" "#2d2d2d" "white"        ))

       (grey       base4)
       (red        '("#f7768e" "#f7768e" "red"          ))
       (orange     '("#bb9af7" "#dd8844" "brightred"    ))
       (green      '("#7aa2f7" "#7aa2f7" "green"        ))
       (teal       `(,(doom-lighten (car green) 0.2) "#44b9b1" "brightgreen"  ))
       (yellow     '("#db4b4b" "#db4b4b" "yellow"       ))
       (blue       '("#73daca" "#73daca" "brightblue"   ))
       (dark-blue  `(,(doom-lighten (car blue) 0.51) "#a0bcf8" "blue"         ))
       (magenta    '("#7dcfff" "#7dcfff" "magenta"      ))
       (violet     `(,(doom-lighten (car magenta) 0.2) "#b751b6" "brightmagenta"))
       (cyan       '("#ad8ee6" "#ad8ee6" "brightcyan"   ))
       (dark-cyan  `(,(doom-lighten (car cyan) 0.2) "#005478" "cyan"         ))

       ;; face categories -- required for all themes
       (highlight      blue)
       (vertical-bar   (doom-darken base1 0.1))
       (selection      dark-blue)
       (builtin        magenta)
       (comments       (if doom-kyoto-night-brighter-comments dark-cyan base5))
       (doc-comments   (doom-lighten (if doom-kyoto-night-brighter-comments dark-cyan base5) 0.25))
       (constants      violet)
       (functions      magenta)
       (keywords       blue)
       (methods        cyan)
       (operators      blue)
       (type           yellow)
       (strings        green)
       (variables      (doom-lighten magenta 0.4))
       (numbers        orange)
       (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
       (error          red)
       (warning        yellow)
       (success        green)
       (vc-modified    orange)
       (vc-added       green)
       (vc-deleted     red)

       ;; custom categories
       (hidden     `(,(car bg) "black" "black"))
       (-modeline-bright doom-kyoto-night-brighter-modeline)
       (-modeline-pad
        (when doom-kyoto-night-padded-modeline
          (if (integerp doom-kyoto-night-padded-modeline) doom-kyoto-night-padded-modeline 4)))

       (modeline-fg     fg)
       (modeline-fg-alt base5)

       (modeline-bg
        (if -modeline-bright
            (doom-darken blue 0.475)
          `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
       (modeline-bg-l
        (if -modeline-bright
            (doom-darken blue 0.45)
          `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
       (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
       (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


      ;; --- extra faces ------------------------
      ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

       (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

       ((line-number &override) :foreground base4)
       ((line-number-current-line &override) :foreground fg)

       (font-lock-comment-face
        :foreground comments
        :background (if doom-kyoto-night-comment-bg (doom-lighten bg 0.05)))
       (font-lock-doc-face
        :inherit 'font-lock-comment-face
        :foreground doc-comments)

       (mode-line
        :background modeline-bg :foreground modeline-fg
        :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
       (mode-line-inactive
        :background modeline-bg-inactive :foreground modeline-fg-alt
        :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
       (mode-line-emphasis
        :foreground (if -modeline-bright base8 highlight))

       (solaire-mode-line-face
        :inherit 'mode-line
        :background modeline-bg-l
        :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
       (solaire-mode-line-inactive-face
        :inherit 'mode-line-inactive
        :background modeline-bg-inactive-l
        :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

       ;; Doom modeline
       (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
       (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
       (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
       (doom-modeline-buffer-project-root :foreground green :weight 'bold)

       ;; ivy-mode
       (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

       ;; --- major-mode faces -------------------
       ;; css-mode / scss-mode
       (css-proprietary-property :foreground orange)
       (css-property             :foreground green)
       (css-selector             :foreground blue)

       ;; LaTeX-mode
       (font-latex-math-face :foreground green)

       ;; markdown-mode
       (markdown-markup-face :foreground base5)
       (markdown-header-face :inherit 'bold :foreground red)
       ((markdown-code-face &override) :background (doom-lighten base3 0.05))

       ;; org-mode
       (org-hide :foreground hidden)
       (solaire-org-hide-face :foreground hidden))

      ;; --- extra variables ---------------------
      ()
      )
;;; doom-kyoto-night-theme.el ends here
