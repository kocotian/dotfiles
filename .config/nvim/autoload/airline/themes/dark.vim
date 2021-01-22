" MIT License. Copyright (c) 2013-2020 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2 tw=80

" Gruvbox colors:
"#000000", #cc241d", #98971a", #d79921", #458588", #b16286", #689d6a", #a89984",
"#928374", #fb4934", #b8bb26", #fabd2f", #83a598", #d3869b", #8ec07c", #ebdbb2",

scriptencoding utf-8

" For this, the dark.vim, theme, this is defined as
let g:airline#themes#dark#palette = {}

" The dark.vim theme:
let s:airline_a_normal   = [ '#00005f' , '#dfff00' , 0   , 3   ]
let s:airline_b_normal   = [ '#ffffff' , '#444444' , 3   , 0   ]
let s:airline_c_normal   = [ '#9cffd3' , '#202020' , 15  , 0   ]
let g:airline#themes#dark#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)

" It should be noted the above is equivalent to:
" let g:airline#themes#dark#palette.normal = airline#themes#generate_color_map(
"    \  [ '#00005f' , '#dfff00' , 17  , 190 ],  " section airline_a
"    \  [ '#ffffff' , '#444444' , 255 , 238 ],  " section airline_b
"    \  [ '#9cffd3' , '#202020' , 85  , 234 ]   " section airline_c
"    \)
"
" In turn, that is equivalent to:
" let g:airline#themes#dark#palette.normal = {
"    \  'airline_a': [ '#00005f' , '#dfff00' , 17  , 190 ],  "section airline_a
"    \  'airline_b': [ '#ffffff' , '#444444' , 255 , 238 ],  "section airline_b
"    \  'airline_c': [ '#9cffd3' , '#202020' , 85  , 234 ],  "section airline_c
"    \  'airline_x': [ '#9cffd3' , '#202020' , 85  , 234 ],  "section airline_x
"    \  'airline_y': [ '#ffffff' , '#444444' , 255 , 238 ],  "section airline_y
"    \  'airline_z': [ '#00005f' , '#dfff00' , 17  , 190 ]   "section airline_z
"    \}
"
" airline#themes#generate_color_map() also uses the values provided as
" parameters to create intermediary groups such as:
"   airline_a_to_airline_b
"   airline_b_to_airline_c
"   etc...

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#dark#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#dark#palette.normal_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 1       , 0       , ''     ] ,
      \ }


let s:airline_a_insert = [ '#00005f' , '#00dfff' , 0   , 2   ]
let s:airline_b_insert = [ '#ffffff' , '#005fff' , 2   , 0   ]
let s:airline_c_insert = [ '#ffffff' , '#000080' , 15  , 0   ]
let g:airline#themes#dark#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#dark#palette.insert_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 1       , 0       , ''     ] ,
      \ }
let g:airline#themes#dark#palette.insert_paste = {
      \ 'airline_a': [ s:airline_a_insert[0]   , '#d78700' , s:airline_a_insert[2] , 172     , ''     ] ,
      \ }

let g:airline#themes#dark#palette.terminal = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

let g:airline#themes#dark#palette.replace = copy(g:airline#themes#dark#palette.insert)
let g:airline#themes#dark#palette.replace.airline_a = [ s:airline_b_insert[0]   , '#af0000' , s:airline_b_insert[3] , 1       , ''     ]
let g:airline#themes#dark#palette.replace_modified = g:airline#themes#dark#palette.insert_modified


let s:airline_a_visual = [ '#000000' , '#ffaf00' , 0   , 4   ]
let s:airline_b_visual = [ '#000000' , '#ff5f00' , 4   , 0   ]
let s:airline_c_visual = [ '#ffffff' , '#5f0000' , 15  , 0   ]
let g:airline#themes#dark#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#dark#palette.visual_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 1       , 0       , ''     ] ,
      \ }


let s:airline_a_inactive = [ '#4e4e4e' , '#1c1c1c' , 239 , 234 , '' ]
let s:airline_b_inactive = [ '#4e4e4e' , '#262626' , 239 , 235 , '' ]
let s:airline_c_inactive = [ '#4e4e4e' , '#303030' , 239 , 236 , '' ]
let g:airline#themes#dark#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#dark#palette.inactive_modified = {
      \ 'airline_c': [ '#875faf' , '' , 5  , '' , '' ] ,
      \ }

" For commandline mode, we use the colors from normal mode, except the mode
" indicator should be colored differently, e.g. light green
let s:airline_a_commandline = [ '#0000ff' , '#0cff00' , 0   , 2  ]
let s:airline_b_commandline = [ '#ffffff' , '#444444' , 2   , 0   ]
let s:airline_c_commandline = [ '#9cffd3' , '#202020' , 15  , 0   ]
let g:airline#themes#dark#palette.commandline = airline#themes#generate_color_map(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#dark#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 2   , ''  ]
      \ }


" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded if the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#dark#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ [ '#d7d7ff' , '#5f00af' , 0   , 5   , ''     ],
        \ [ '#ffffff' , '#875fd7' , 5   , 0   , ''     ],
        \ [ '#5f00af' , '#ffffff' , 15  , 0   , 'bold' ])
endif
