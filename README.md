### Recursos

- Páginas de login mais recentes e atualizadas.
- Suporte para máscara de URL
- Amigável para iniciantes
- Suporte Docker (checkout `docker-legacy` branch)
- Múltiplas opções de tunelamento
   - Localhost
   - Ngrok (com ou sem ponto de acesso)


### Instalação

- Basta clonar este repositório -
`` `
$ git clone git: //github.com/SukunaBR/zphisher.git
`` `

- Mude para o diretório clonado e execute `zphisher.sh` -
`` `
$ cd zphisher
$ bash zphisher.sh
`` `

- No primeiro lançamento, instalará as dependências e pronto. `Zphisher` está instalado.

### Executar no Docker
`` `
$ docker pull htrtech / zphisher
$ docker run --rm -it htrtech / zphisher
`` `

### Dependências

** `Zphisher` ** requer os seguintes programas para funcionar corretamente -
- `php`
- `wget`
- `curl`
- `git`

> Todas as dependências serão instaladas automaticamente quando você executar `Zphisher` pela primeira vez.

> Plataforma suportada: ** `Termux` **, **` Ubuntu / Debian / Kali` **, ** `Arch Linux / Manjaro` **, **` Fedora` **