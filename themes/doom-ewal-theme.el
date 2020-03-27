(require 'doom-ewal-themes)

(defgroup doom-ewal-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-ewal-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-ewal-theme
  :type 'boolean)

(defcustom doom-ewal-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-ewal-theme
  :type 'boolean)

(defcustom doom-ewal-comment-bg doom-ewal-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-ewal-theme
  :type 'boolean)

(defcustom doom-ewal-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-ewal-theme
  :type '(choice integer boolean))

(ewal-load-colors)

(def-doom-theme doom-ewal
  "A theme that pulls colors from the Pywal cache via ewal.el"

  ;; name        default   256       16
  ((bg         (ewal-doom-themes-get-color 'background  0))
   (bg-alt     (ewal-doom-themes-get-color 'background -3))
   (base0      (ewal-doom-themes-get-color 'background -5))
   (base1      (ewal-doom-themes-get-color 'background -4))
   (base2      (ewal-doom-themes-get-color 'background -2))
   (base3      (ewal-doom-themes-get-color 'background -1))
   (base4      (ewal-doom-themes-get-color 'background +1))
   (base5      (ewal-doom-themes-get-color 'comment     0))
   (base6      (ewal-doom-themes-get-color 'background +4))
   (base7      (ewal-doom-themes-get-color 'background +5))
   (base8      (ewal-doom-themes-get-color 'foreground +1))
   (fg         (ewal-doom-themes-get-color 'foreground  0))
   (fg-alt     (ewal-doom-themes-get-color 'foreground -1))

   (grey       base4)
   (red        (ewal-doom-themes-get-color 'red      -1))
   (orange     (ewal-doom-themes-get-color 'red       0))
   (green      (ewal-doom-themes-get-color 'green    -1))
   (teal       (ewal-doom-themes-get-color 'green     0))
   (yellow     (ewal-doom-themes-get-color 'yellow   -1))
   (blue       (ewal-doom-themes-get-color 'blue      0))
   (dark-blue  (ewal-doom-themes-get-color 'blue     -1))
   (magenta    (ewal-doom-themes-get-color 'magenta   0))
   (violet     (ewal-doom-themes-get-color 'magenta  -1))
   (cyan       (ewal-doom-themes-get-color 'cyan      0))
   (dark-cyan  (ewal-doom-themes-get-color 'cyan     -1))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-lighten base1 0.2))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-ewal-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-ewal-brighter-comments dark-cyan base5) 0.25))
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
   (-modeline-bright doom-ewal-brighter-modeline)
   (-modeline-pad
    (when doom-ewal-padded-modeline
      (if (integerp doom-ewal-padded-modeline) doom-ewal-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base6)

   (modeline-bg
    (if -modeline-bright
        (doom-lighten bg 0.7)
      (doom-lighten base3 0.2)))
   (modeline-bg-l
    (if -modeline-bright
        (doom-lighten bg 0.7)
      (doom-darken bg 0.05)))
   (modeline-bg-inactive   (doom-darken bg 0.02))
   (modeline-bg-inactive-l (doom-darken bg 0.025)))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (hl-line :background base3)

   ((line-number &override) :foreground base6)
   ((line-number-current-line &override) :foreground fg :background region :weight 'bold)

   (org-block :background (doom-blend yellow bg 0.04))
   (org-block-background :background (doom-blend yellow bg 0.04))
   (org-block-begin-line :background (doom-blend yellow bg 0.08))
   (org-block-end-line :background (doom-blend yellow bg 0.08))
   (lsp-ui-sideline-code-action :foreground blue)

   (font-lock-comment-face
    :slant 'italic
    :foreground comments
    :background (if doom-ewal-comment-bg (doom-blend teal base0 0.07)))
   ((font-lock-doc-face &override) :foreground doc-comments)
   ((font-lock-type-face &override) :slant 'italic)
   ((font-lock-builtin-face &override) :slant 'italic)
   ((font-lock-function-name-face &override) :foreground type)

   (font-lock-keyword-face
    :weight 'bold
    :foreground keywords)

   (font-lock-constant-face
    :weight 'bold
    :foreground constants)


   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

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

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;; ivy-mode
   (ivy-current-match :background (doom-lighten bg 0.3))
   (ivy-minibuffer-match-face-1 :foreground blue :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-2 :foreground magenta :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground green   :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground yellow  :background base3 :weight 'bold)
   (ivy-minibuffer-match-highlight :foreground violet :weight 'bold)
   (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
   (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
   (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
   (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)

   ;; posframe
   (ivy-posframe :background modeline-bg-l)
   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)

   ;; helm
   (helm-selection :foreground base0 :weight 'bold :background blue)

   ;; company
   (company-tooltip-selection :background blue
                              :foreground base3)

   ;; widget
   (widget-field :foreground fg :background base3)
   (widget-single-line-field :foreground fg :background base3)

   ;; latex
   (font-latex-sedate-face :foreground base6)

   )


  ;; --- extra variables ---------------------
  ;; ()
  )

;; doom-ewal-theme.el ends here
