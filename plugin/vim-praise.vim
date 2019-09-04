let s:templates = [
      \ '{{exclam}}! You''re {{anadverb}} {{adjective}} Vim {{type}}.',
      \ '{{exclam}}! You''re {{anadverb}} {{adjective}} editing {{type}}.',
      \ '{{exclam}}! Your editing skills are {{adverb}} {{adjective}}.' 
      \]

let s:types = [
      \ {'particle': 'a',  'word': 'master'},
      \ {'particle': 'a',  'word': 'guru'},
      \ {'particle': 'a',  'word': 'hero'},
      \ {'particle': 'a',  'word': 'champion'},
      \ {'particle': 'a',  'word': 'star'},
      \ {'particle': 'a',  'word': 'megastar'},
      \ {'particle': 'a',  'word': 'virtuoso'},
      \ {'particle': 'an', 'word': 'adept'},
      \ {'particle': 'a',  'word': 'hotshot'},
      \ {'particle': 'a',  'word': 'grandmaster'},
      \ {'particle': 'a',  'word': 'genious'},
      \ {'particle': 'a',  'word': 'wizard'},
      \ {'particle': 'a',  'word': 'sensation'}
      \]

let s:adjectives = [
      \ {'particle': 'an', 'word': 'amazing'},
      \ {'particle': 'an', 'word': 'awesome'},
      \ {'particle': 'a',  'word': 'brilliant'},
      \ {'particle': 'an', 'word': 'astonishing'},
      \ {'particle': 'an', 'word': 'astounding'},
      \ {'particle': 'an', 'word': 'awe-inspiring'},
      \ {'particle': 'an', 'word': 'awesome'},
      \ {'particle': 'a',  'word': 'breathtaking'},
      \ {'particle': 'a',  'word': 'brilliant'},
      \ {'particle': 'a',  'word': 'dazzling'},
      \ {'particle': 'a',  'word': 'divine'},
      \ {'particle': 'an', 'word': 'epic'},
      \ {'particle': 'an', 'word': 'excellent'},
      \ {'particle': 'an', 'word': 'exceptional'},
      \ {'particle': 'an', 'word': 'exquisite'},
      \ {'particle': 'an', 'word': 'extraordinary'},
      \ {'particle': 'a',  'word': 'fantastic'},
      \ {'particle': 'a',  'word': 'first-class'},
      \ {'particle': 'a',  'word': 'flawless'},
      \ {'particle': 'a',  'word': 'glorious'},
      \ {'particle': 'a',  'word': 'gorgeous'},
      \ {'particle': 'a',  'word': 'grand'},
      \ {'particle': 'a',  'word': 'great'},
      \ {'particle': 'a',  'word': 'groovy'},
      \ {'particle': 'a',  'word': 'groundbreaking'},
      \ {'particle': 'an', 'word': 'impressive'},
      \ {'particle': 'an', 'word': 'incredible'},
      \ {'particle': 'a',  'word': 'legendary'},
      \ {'particle': 'a',  'word': 'magnificent'},
      \ {'particle': 'a',  'word': 'marvelous'},
      \ {'particle': 'a',  'word': 'mind-blowing'},
      \ {'particle': 'an', 'word': 'outstanding'},
      \ {'particle': 'a',  'word': 'perfect'},
      \ {'particle': 'a',  'word': 'phenomenal'},
      \ {'particle': 'a',  'word': 'premium'},
      \ {'particle': 'a',  'word': 'priceless'},
      \ {'particle': 'a',  'word': 'remarkable'},
      \ {'particle': 'a',  'word': 'sensational'},
      \ {'particle': 'a',  'word': 'smashing'},
      \ {'particle': 'a',  'word': 'solid'},
      \ {'particle': 'a',  'word': 'spectacular'},
      \ {'particle': 'a',  'word': 'stellar'},
      \ {'particle': 'a',  'word': 'striking'},
      \ {'particle': 'a',  'word': 'stunning'},
      \ {'particle': 'a',  'word': 'super'},
      \ {'particle': 'a',  'word': 'superb'},
      \ {'particle': 'a',  'word': 'superior'},
      \ {'particle': 'a',  'word': 'supreme'},
      \ {'particle': 'a',  'word': 'terrific'},
      \ {'particle': 'a',  'word': 'transcendent'},
      \ {'particle': 'an', 'word': 'ultimate'},
      \ {'particle': 'an', 'word': 'unbelievable'},
      \ {'particle': 'an', 'word': 'unreal'},
      \ {'particle': 'a',  'word': 'wicked'},
      \ {'particle': 'a',  'word': 'wondrous'},
      \ {'particle': 'a',  'word': 'world-class'}
      \]

let s:adverbs = [
      \ {'particle': 'a',  'word': 'beautifully'},
      \ {'particle': 'a',  'word': 'calmly'},
      \ {'particle': 'a',  'word': 'cheerfully'},
      \ {'particle': 'a',  'word': 'clearly'},
      \ {'particle': 'a',  'word': 'daringly'},
      \ {'particle': 'an', 'word': 'effectively'},
      \ {'particle': 'an', 'word': 'elegantly'},
      \ {'particle': 'an', 'word': 'enormously'},
      \ {'particle': 'a',  'word': 'frantically'},
      \ {'particle': 'a',  'word': 'generously'},
      \ {'particle': 'a',  'word': 'joyously'},
      \ {'particle': 'a',  'word': 'perfectly'},
      \ {'particle': 'a',  'word': 'powerfully'},
      \ {'particle': 'a',  'word': 'really'},
      \ {'particle': 'a',  'word': 'repeatedly'},
      \ {'particle': 'a',  'word': 'rightfully'},
      \ {'particle': 'a',  'word': 'seriously'},
      \ {'particle': 'a',  'word': 'sharply'},
      \ {'particle': 'a',  'word': 'smoothly'},
      \ {'particle': 'a',  'word': 'speedily'},
      \ {'particle': 'a',  'word': 'successfully'},
      \ {'particle': 'a',  'word': 'swiftly'},
      \ {'particle': 'a',  'word': 'truly'},
      \]

let s:exclams = [
      \ 'Easy as, bro',
      \ 'Sweet as, bro',
      \ 'YEES',
      \ 'WOOT',
      \ 'OMG',
      \ 'Dude'
      \]

function! s:NotSoRandom(bound)
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:bound
endfunction

function! s:Sub(template)
  if stridx(a:template, "{{") < 0
    return a:template
  endif

  let l:new_template = a:template

  if stridx(a:template, "{{type}}") >= 0
    let l:type = s:types[s:NotSoRandom(len(s:types))]
    let l:new_template = substitute(a:template, "{{type}}", l:type.word, "") 
  endif

  if stridx(a:template, "{{atype}}") >= 0
    let l:type = s:types[s:NotSoRandom(len(s:types))]
    let l:new_template = substitute(a:template, "{{atype}}", l:type.particle . " " . l:type.word, "") 
  endif

  if stridx(a:template, "{{adjective}}") >= 0
    let l:adjective = s:adjectives[s:NotSoRandom(len(s:adjectives))]
    let l:new_template = substitute(a:template, "{{adjective}}", l:adjective.word, "")
  endif

  if stridx(a:template, "{{anadjective}}") >= 0
    let l:adjective = s:adjectives[s:NotSoRandom(len(s:adjectives))]
    let l:new_template = substitute(a:template, "{{anadjective}}", l:adjective.particle . " " . l:adjective.word, "")
  endif

  if stridx(a:template, "{{adverb}}") >= 0
    let l:adverb = s:adverbs[s:NotSoRandom(len(s:adverbs))]
    let l:new_template = substitute(a:template, "{{adverb}}", l:adverb.word, "")
  endif

  if stridx(a:template, "{{anadverb}}") >= 0
    let l:adverb = s:adverbs[s:NotSoRandom(len(s:adverbs))]
    let l:new_template = substitute(a:template, "{{anadverb}}", l:adverb.particle . " " . l:adverb.word, "")
  endif

  if stridx(a:template, "{{exclam}}") >= 0
    let l:excl = s:exclams[s:NotSoRandom(len(s:exclams))]
    let l:new_template = substitute(a:template, "{{exclam}}", l:excl, "")
  endif

  return s:Sub(l:new_template)
endfunction


function! g:Praise()
  let l:template = s:templates[s:NotSoRandom(len(s:templates))]
  echom s:Sub(l:template)
endfunction

command! PRAISE call g:Praise()

autocmd BufEnter * PRAISE
