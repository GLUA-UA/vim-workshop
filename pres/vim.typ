#import "template.typ": *

#show: doc => conf(doc)

#glua-title-slide("Workshop de Vim", ("Tiago Garcia", "João Felisberto"), subtitle: "Vem sem saber sair, vai sem motivo para o fazer")

/*
#glua-slide("Ideias")[
  - Introdução
    - Para quem é o Vim (termo de responsabilidade)
      - shillar eficiência 
    - Editor modal
      - Modos
  - _Vim motions_ e plugins para editores de texto (*vimtutor*)
    - _Insert mode_ (`i` `o` `a` `O`)
    - `h` `j` `k` `l`
    - `^` `$` `w` `e` `b` `[0-9]+`
    - `x` `r` `d` `y` `p`
    - `A` `I` `D`
    - `u` `Ctrl+R`
    - `G` `gg` `<line>G`
  - Vim
    - `:q` `:w` `:wq` `:q!` `Shift+Z+Z` `Shift+Z+Q` `:x`
    - `/`
    - `Ctrl+o` `Ctrl+i`
    - `:s` `:%s` `:'<,'>s` `:#,#s`
      - exemplificar na forma superior de fazer endereçamento em C
    - `%`
    - _Visual mode_
    - `:r <file>`
    - comandos shell `:!`
    - macros
    - `:sort`
  - Configurar o Vim (*vimrc*)
    - help
		- help option-list
    - rato
    - remaps
      - `vi<[{>`
	  - `vi<[{>Vd` apagar scope atual
    - `set ignorecase`
    - outras regras roubadas das nossas configs
		- ligar clipboards
		- search hilight
  - Vim enquanto IDE
    - o que são plugins
    - instalar plugins
    - snippets
    - configuração estilo vscode
      - file tree
      - tabs
      - debug
      - completion
      - usages
      - git
  - NeoVim
    - o que resolve
    - instalar um plugin
    - folke/trouble.nvim
    - Copilot/GPT
  - Flex
    - resolver um AoC
    - `gf` `gJ`
]
*/

#glua-slide("Introdução")[
  Isto é difícil de fazer blehhh

  == Editor modal

  - Normal `Esc`
  - Insert  `i`, `a`, `I`, `A`
  - Visual `v`, `Shift+v`, `Ctrl+v` 
]

#glua-slide("Vim Motions")[
  - O _modo vim_ pode ser usado na maioria dos editores.
  - Traz o poder do vim à conveniência do editor em questão.

  #table(columns: 2)[
    `h`
  ][Esquerda][
    `j`
  ][Cima][
    `k`
  ][Baixo][
    `l`
  ][Direita]
]

#glua-slide("Vim Motions")[
  #table(columns: 2)[
    `^` `0`
  ][Início da linha][
    `$`
  ][Fim da linha][
    `w`
  ][Próxima palavra][
    `b`
  ][Palavra anterior][
    `e`
  ][Fim da palavra][
    `gg`, `H`
  ][Início do ficheiro][
    `G`
  ][Fim do ficheiro]
]

#glua-slide("Copiar e Colar")[
  == Forma Geral
  `[repetições] [movimento] comando`

  == Teclas

  #table(columns: 2)[
    `y`][ Copiar ][
    `p`][ Colar ][
    `d`, `x`][ Cortar ][
    `D`][ Cortar até ao fim da linha ][
    `<ln>G`][ Ir para a linha `<ln>` ]
  
]

#glua-slide("Sair do Vim")[

  \<Inserir memes aqui\>

  #table(columns: 2)[
    `:w`][ Guardar ][
    `:q`][ Sair ][
    `:wq`, `ZZ`][ Guardar e sair ][
    `:q!`, `ZQ`][ Sair sem guardar ]

]

#glua-slide("Pesquisa e substituição")[

  == Forma Geral
  `:<substituição>/<string inicial>/<string final>/[modificadores]`

  #grid(
    columns: 2, 
    column-gutter: 15pt,
    [
      == Teclas

      #table(columns: 2)[
        `:s`][ Substituir na linha ][
        `:%s`][ Substituir no ficheiro ][
        `:'<,'>s`][ Substituir em modo visual ][
        `:#,#s`][ Substituir entre linhas ]
    ],[
      == Modificadores

      #table(columns: 2)[`g`][ Substituir todas as ocorrências na linha ] 
    ],[
  ]
)
]

#glua-slide("Vim enquanto IDE")[
  Explicar por alto o que vamos fazer
]

#glua-slide("Gestão de plugins")[
  - https://github.com/junegunn/vim-plug
  - Plugins podem ser geridos com um gestor de plugins.
  - Podem ser instalados manualmente também
  - `vim-plug` é o mais usado
]

#glua-slide("LSP")[
  = O que é

  Language Server Protocol (LSP) é um protocolo que permite comunicar com um servidor que processa código e dá informação sobre ele.

  - Verifica validade sintática
  - Indica possíveis elementos sintáticos no contexto
  - Dá erros e avisos

  Por si só faz pouco, precisa do servidor e de um plugin para efetivamente dar as sugestões.
]

#glua-slide("LSP")[
  = Como configurar

  - https://github.com/prabirshrestha/vim-lsp
  - https://github.com/mattn/vim-lsp-settings

  Ao abrir um ficheiro com uma extensão reconhecida, sugere-se o LSP adequado.

  NOTAS: 
  - `clangd` tem de ser instalado à parte	
  - LSP de python requer `python3.11-venv` (no Ubuntu)
]

#glua-slide("NERDTree")[
  - https://github.com/preservim/nerdtree
  - Plugin que mostra a árvore de diretórios dum modo mais legível.

  == Configurações

  - Abrir NERDTree quando se abre o Vim num diretório
  - Fechar o Vim quando apenas o NERDTree está aberto
  - Fechar tab quando apenas o NERDTree está aberto
  - Abrir o NERDTree em cada tab
  - Atalhos para abrir e fechar o NERDTree
]

#glua-slide("Snippets")[
  - https://github.com/SirVer/ultisnips
  - https://github.com/honza/vim-snippets

  Dividida em 2 partes:
  - _engine_ de snippets
  - os snippets em si
]

#glua-slide("Code completion")[
  - https://github.com/neoclide/coc.nvim

  Necessário instalar `nodejs` e `npm`.

  Oferece sugestões de código, tal como numa IDE, com base num LSP. 

  Instalar suporte para _language servers_ com `:CocInstall <language server>`.

  Ver outros servidores na [wiki](https://github.com/neoclide/coc.nvim/wiki/Language-servers)

  - clangd
  - coc-pyright
]

#glua-slide("Temas")[
  Cada tema opera como um plugin.

  Comando `colorscheme <tema>` define tema.

  Pode ser necessário usar `set termguicolors` para corrigir cores.

  Vamos exemplificar com `Nord` e `OneDark`.
]

#glua-slide("Git")[
  - https://github.com/airblade/vim-gitgutter

  Integra com repositórios git

  Para uma experiência mais responsiva, `set updatetime=100`
]

