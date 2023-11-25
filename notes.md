#### 24/11/2023

Curso de Flutter: aplicando gerenciamento de estados com MobX

@01-Gerenciamento de estados em Flutter 

@@01
Apresentação

Boas-vindas! Sou Matheus Alberto, instrutor da Escola de Mobile na Alura.
Autodescrição: Sou um homem branco de cabelos castanhos escuros curtos. Tenho olhos castanhos escuros e estou com a barba feita. Estou vestindo uma camiseta azul escura. Ao fundo, há uma parede lisa azul clara.
O que vamos aprender?
Neste curso, vamos desenvolver um aplicativo de delivery chamado Panucci Delivery. Nele, podemos adicionar itens na sacola de compras e conferir o valor total na parte inferior da tela. Clicando no botão "Ver carrinho", seremoss redirecionados para a página de checkout, onde é possível validar os itens escolhidos e finalizar o pedido.

Trabalharemos com gerenciador de estados MobX. Estudaremos conceitos como actions e observables (observáveis). Também aprendemos como recuperar as informações dos observáveis e transportá-los para toda nossa aplicação, utilizando provider.

Gerenciadores de estado são muito utilizados no mercado de trabalho, porque facilitam bastante o processo de lidar com variáveis e objetos mutáveis que precisam ter algum tipo de reflexo na parte visual da aplicação. Por exemplo, caso um valor seja atualizado e precisemos de uma ação refletida na tela, os gerenciadores de estado são uma ótima ferramenta para facilitar esse trabalho.

Pré-requisito
O único pré-requisito para este curso é que você tenha conhecimento de gerenciadores de estado com provider. É interessante saber como passar informações de provider com as telas, principalmente com relação ao context.

Espero ter despertado seu interesse! Te convido para participar dessa aventura comigo. Vamos mergulhar nesse mar de conhecimento?

@@02
Preparando o ambiente

Olá, Dev!
Matheus por aqui!

Você está iniciando seu mergulho no curso sobre Flutter: aplicando gerenciamento de estados com MobX!

Vamos preparar o ambiente baixando o projeto?

1) Baixando o projeto
Neste curso, vamos implementar funcionalidades importantes no projeto Panucci Delivery.

Para seguir com seus estudos, siga os passos a seguir, conforme as instruções.

2) Do que preciso para rodar o projeto?
Ter uma IDE, que pode ser o Android Studio, instalada na sua máquina;
Ter a SDK do Flutter na versão 3.7.1.
3) O que vou aprender neste curso?
Vamos aprofundar nossos conhecimentos e habilidades em um popular gerenciador de estados: o MobX! Isso é muito importante pois, conforme nossa aplicação cresce, precisamos lidar com os dados e passar informações entre telas de forma mais otimizada e que facilite o processo de desenvolvimento!

Também, o MobX é bastante requisitado pelas empresas.

4) Como fazer este curso?
Durante sua jornada, você encontrará atividades práticas e teóricas para testar seus conhecimentos, material extra para se aprofundar nos seus estudos, e desafios para praticar suas habilidades.

Vamos ver dicas para fazer bem este curso?

Levante a mão e participe! Tudo bem se não conseguir realizar alguma atividade, isso faz parte do processo. Procure o fórum ou nossa comunidade no Discord e aproveite para tirar dúvidas, para interagir com outras pessoas e ajudar um colega (ensinar é uma ótima forma de aprender);
Pratique! Faça, teste, replique as atividades sinalizadas pelo instrutor, pois assim ganhará confiança e fixará melhor o conteúdo;
Foque, mas descanse! Caso sinta-se cansado(a) ou não esteja entendendo algo, dê uma pausa, tome uma água, e depois assista novamente as videoaulas;
O importante é persistir até o fim! Preparado(a)? Podemos começar.

Bons estudos!

Um abraço,

Matheus Alberto

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/archive/refs/heads/main.zip

@@03
Conhecendo o projeto

É importante que, neste momento do curso, você já tenha baixado os arquivos do projeto. Caso não tenha feito isso ainda, recomenda-se voltar à atividade anterior e baixar os arquivos antes de prosseguir.
Depois de baixados e extraídos em uma pasta, vamos conferir como é a estrutura do projeto em uma IDE. No caso, estou usando o Visual Studio Code, mas você pode utilizar a de sua preferência. Executando o arquivo main.dart (na pasta "lib"), podemos conferir no emulador como está o projeto atualmente.

Tela inicial
No topo da tela, há um campo de busca. Na parte central da tela, há três categorias. De cima para baixo, são elas: "Mais comprados", "Para o almoço" e "Para dividir". Abaixo de cada categoria, há cartões de produtos dispostos horizontalmente. Cada cartão contém uma imagem, o nome do produto, um valor em reais e a quantidade adicionada ao carrinho (por padrão, zero). Na parte inferior, há um botão vermelho escrito "Ver carrinho" no centro. Na parte esquerda do botão, há um ícone de cesta com o número de itens no carrinho. Na parte direita, há o valor total em reais.

O que cada um dos componentes na tela representa está dentro da pasta "lib", em que temos as subpastas:

components (componentes)
models (modemos)
screens (telas)
Além disso, temos um arquivo chamado cardapio.dart, que contém todas as informações necessárias para preencher as listas de cada categoria da aplicação, como "Mais comprados", "Para o almoço" e "Para dividir". Dentro dessas listas, temos os nomes de cada um dos cartões, a qual categoria ela pertence, qual seu valor e a URL da imagem.

O componente mais importante com o qual vamos trabalhar é o cartao.dart, porque ele engloba toda a estrutura da imagem, do nome do produto, do preço e do contador, que é um componente separado cuja única responsabilidade é adicionar e remover itens do carrinho de compras.

A estrutura do arquivo contador.dart é bem simples. Temos o botão de remover, o texto que indica a quantidade e o botão de adicionar. Atualmente, esses botões não estão funcionais. Vamos trabalhar neles ao longo do curso.

Ao adicionar ou remover itens do carrinho, queremos mostrar a quantidade de itens e o valor total da compra na parte de baixo da tela. Esse componente está no final do arquivo home.dart, na pasta "screens".

Ele recebe a quantidade de itens na sacola, exibe o texto "Ver carrinho" e também mostra o valor total da compra. Trata-se de funcionalidades que também implementaremos no curso.

Tela de checkout
Ao clicar no botão "Ver carrinho" na parte inferior, a pessoa usuária será direcionada para a página de checkout. Como nós ainda não implementamos a navegação, não conseguiremos acessá-la pelo emulador agora, mas podemos conferir seu leiaute no Figma.

Na tela de checkout, temos a seção "Pedido" com a lista de itens adicionados no carrinho. Em seguida, temos a seção "Pagamento", em que é possível selecionar um cartão. Depois, temos a seção "Confirmar", com o valor final da compra. Na parte inferior, há um botão vermelho escrito "Pedir". Todos esses componentes estão na pasta "components" e no arquivo checkout.dart (na pasta "screens").

É importante que você tenha o Flutter na versão 3.7.1. No arquivo pubspec.yaml, a partir da linha 30, temos as seguintes dependências:

Mobx 2.1.3+1
Flutter_mobx 2.0.6+5
Provider 6.0.5
A partir da linha 42, temos as seguintes dependências de desenvolvimento:

build_runner 2.3.3
mobx_codegen 2.1.1
É necessário que você tenha todas essas dependências nas versões mencionadas nesse arquivo. A IDE provavelmente as baixará automaticamente, mas, caso não faça, basta abrir o terminal e rodar o seguinte comando:

flutter pub getCOPIAR CÓDIGO
Feito isso, podemos seguir com o nosso projeto.

@@04
Estados com setState

Vamos começar fazendo o nosso cartão adicionar itens na sacola, então trabalharemos no componente de contador. No arquivo contador.dart, temos duas funções: adição e remoção de itens.
Já que queremos alterar um valor que será refletido depois na tela, vamos usar um StatefulWidget. Portanto, na linha 3, vamos converter o StatelessWidget para o StatefulWidget:

class Contador extends StatefulWidgetCOPIAR CÓDIGO
Agora, precisamos de algum lugar para guardar as informações de quantidade de itens selecionados. Dentro do contador, vamos criar uma variável do tipo inteiro chamada valorContador, inicializada com o valor zero:

// ...

class _ContadorState extends State<Contador> {
  int valorContador = 0;

// ...COPIAR CÓDIGO
Toda vez que quisermos fazer uma alteração nessa variável e ela ser refletida na aplicação, o primeiro passo é mostrá-la na tela. Atualmente, na linha 24, temos um Text com valor fixo igual a 0 em string. Alteraremos esse valor para utilizar a variável valorContador:

// ...

Text(valorContador.toString())

// ...COPIAR CÓDIGO
Como o Text só recebe textos, usamos o método toString() para converter o número inteiro em string. Podemos salvar as alterações e notaremos que a aplicação continua funcionando.

Botão de remoção
O primeiro botão é responsável pela remoção de um item. Para alterar o valor da variável e espelhá-lo na tela, dentro de onTap(), usaremos a função setState(). Como estamos subtraindo do contador, colocaremos valorContador--:

// ...

InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        setState(() {
                valorContador--;
        });
    },
    child: const Icon(Icons.remove_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
O valor inicial é zero e não pretendemos usar números negativos. Então, vamos inserir uma estrutura if para garantir que esse botão só funcionará se o valor for maior que zero:

// ...

InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        setState(() {
                if(valorContador > 0) {
                        valorContador--;
                }
        });
    },
    child: const Icon(Icons.remove_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
Ao salvar as alterações, notaremos que a aplicação continua funcionando.

Botão de adição
No segundo botão, vamos desenvolver a lógica para adicionar um item ao carrinho. Similarmente ao anterior, usaremos a função setState() com valorContador++:

// ...

InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        setState(() {
                valorContador++;
        });
    },
    child: const Icon(Icons.add_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
Vamos salvar e testar. No emulador, ao clicar nos botões de remoção e adição de um produto, o número do contador será atualizado na tela.

Limitações da aplicação
Por enquanto, conseguimos trabalhar usando o StatefulWidget. No entanto,encontraremos algumas limitações na nossa aplicação. Por exemplo, o valor do contador está sendo utilizado apenas dentro do widget de contador. Ele apenas modifica o número exibido, mas não insere um item no carrinho nem altera a lista de compras, de fato.

Além disso, as funções de remoção e adição simplesmente incrementam ou decrementam um valor, a partir do próprio botão que é acessível apenas dentro do contador. E se quisermos acessar essa função em outros lugares da aplicação para alterar a quantidade de um item?

Não bastasse, os valores que aparecem na parte inferior da tela são globais, que devem ser acessíveis de qualquer lugar a aplicação. Ao adicionar um item na sacola, por exemplo, tanto a quantidade de itens quanto o valor total em reais deveria ser modificado.

E como passamos todos esses valores para outras telas? Na página de checkout, temos uma lista de tudo que pretendemos comprar, bem como o valor total do carrinho.

Com o Flutter, conseguimos resolver essas questões com InheritedWidget e até mesmo com StatefulWidget. Contudo, à medida que aplicação fica mais complexa, torna-se difícil manter o controle de onde utilizaremos cada função e como passamos informações de um widget a outro de maneira consistente e evitando problemas de duplicidade.

Uma forma melhor de lidar com todos esses problemas é o uso de gerenciadores de estados. Eles lidam com todos os estamos de várias partes da aplicação, assim temos um controle mais tranquilo e agradável. No próximo vídeo, aprenderemos sobre esse assunto.

@@05
setState

Em um app, geralmente vamos precisar alterar valores e atualizá-los na tela, por exemplo:
Um “carrinho” ou “sacola” de um app de delivery ou qualquer site de compras;
2965-img-1-gif-aula-1.gif

Um filtro de produtos em uma aplicação de controle de estoque.
Para resolver esse desafio, podemos utilizar várias abordagens. Em geral, alterar valores do Flutter é simples - podemos fazer isso com o Stateful widget e o setState.

Escolha as alternativas que melhor representam as limitações de usar Stateful widgets com setState():

Apenas utilizando funcionalidades nativas do Flutter, não existe uma maneira de lidar com estados globais da aplicação.
 
Alternativa correta
Pensando em valores globais (valores que precisam ser acessados em toda a aplicação), apenas Stateful widgets e o setState geram uma enorme dependência entre widgets, precisando passar cada valor dentro do construtor de cada widget da árvore de widgets.
 
Uma opção nativa para lidar com valores globais é o Inherited widget.
Alternativa correta
Podemos acessar funções que alteram valores apenas dentro do Stateful widget. Se tivermos um modelo de contador, não podemos acessar esses valores, pois o acesso fica restrito apenas dentro do modelo.
 
Alternativa correta
Com Stateful widgets, nós não conseguimos redesenhar partes específicas do código (ex. onde a variável que terá o valor atualizado está). Todo o widget será redesenhado, perdendo performance se o widget for muito complexo.
 
Exatamente! Por padrão, com o Stateful widget, nós não temos esse controle preciso das partes que serão redesenhadas na tela. Isso, no decorrer do desenvolvimento do projeto, pode causar problemas de performance, pois redesenhar a tela do app, por inteiro, é uma ação custosa para o processador, prejudicando o rendimento dos dispositivos móveis.

@@06
Para saber mais: gerenciadores de estado

No projeto Panucci Delivery, temos uma missão: criar um botão de contador que aumenta ou diminui a quantidade de um produto (um chicken salad, por exemplo).
2965-img-1-gif-aula-1.gif

Tentamos, primeiramente, a abordagem com o setState, porém identificamos problemas relevantes e constatamos que a solução mais eficiente é utilizar um gerenciador de estado.

O que é um estado e o tal gerenciador?
Se você perceber, um aplicativo está constantemente mudando: navegamos de uma tela para outra, alteramos valores de produtos, a tela é redesenhada conforme escrevemos textos. Então, com aplicativos, a mudança e impermanência são a regra básica de funcionamento.

Como você deve perceber, lidar com a constante mudança e alterações na tela é bastante trabalhoso. Para lidar com essas mudanças de forma otimizada e inteligente, existem os gerenciadores de estado.

Se você não conhece o termo estado, podemos fazer uma analogia simples:

Imagine: é sexta-feira e você está deitado(a) no sofá, quase dormindo. Nesse momento, seu estado é sonolento. Então, uma amiga - super empolgada - liga e anima você a sair de casa - então, seu estado mudou de sonolento(a) para animado(a).
No contexto de uma aplicação Flutter, o estado está relacionado aos diferentes valores que uma variável pode assumir. Lembra quando falamos que um app muda o tempo todo? Pois é: o app vai passando por diferentes estados.

No caso do nosso contador de produtos, ele pode ter vários estados:

Zero produtos;
1 produto;
2 produtos;
etc.
O nosso carrinho, também, pode ter vários estados:

1 pizza e 1 chicken salad selecionados;
2 pizzas selecionadas.
Como você pode ver, são muitos estados possíveis para cada um dos produtos - chicken salad, pizza etc. Para gerenciar de forma organizada tantos dados (que mudam constantemente) é que utilizamos, justamente, os gerenciadores de estado. Além disso, esses eles têm outras vantagens:

Mais controle e poder de codar: eles ajudam pessoas desenvolvedoras a ter um melhor controle de variáveis/objetos. Por exemplo: os gerenciadores nos dão a habilidade de fazer o Flutter saber quando ocorreram mudanças e se essas mudanças devem ser refletidas na tela para a pessoa usuária. Se a pessoa adicionou dois produtos no carrinho, é interessante que o “valor total” do carrinho seja atualizado com o novo valor (estado);
Mais performance: o gerenciador de estado permite atualizar trechos específicos do widget, em vez do widget inteiro - o que aumenta a performance do código;
Mais facilidade e flexibilidade para a pessoa dev: lembrando das nossas limitações com o setState, elas não são necessariamente limitações do que o Flutter consegue fazer, mas impõe uma camada de dificuldade desnecessária quando vamos codar uma aplicação. Em resumo: tudo o que gerenciadores de estado fazem, no fundo, são funcionalidades padrão do Flutter, mas organizadas de uma maneira que facilita o nosso processo de desenvolvimento.
Nesse curso, você aprenderá a lidar com o MobX - um famoso gerenciador de estados.

Independente do gerenciador de estado que nós vamos utilizar, é importante separar as responsabilidades em arquivos diferentes. É o que veremos na próxima aula!
Bons estudos!

@@07
O que aprendemos?

Nessa aula, você aprendeu como:
Baixar e entender o código e organização do projeto Panucci Delivery;
Compreender as limitações do Stateful widget e do setState() quando precisamos alterar e exibir variáveis em aplicativos mobile;
Entender o que são gerenciadores de estado e para que servem.
Concluímos nossa primeira aula! Vejo você a seguir.

Bons estudos!

#### 25/11/2023

@02-Configurando o MobX

@@01
Projeto da aula anterior

Você pode acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/archive/refs/heads/Aula1.zip

@@02
Preparando o app para receber o gerenciador MobX

No vídeo anterior, discutimos a possibilidade de usar gerenciadores de estados para lidar com os vários estados na nossa aplicação. Antes de utilizá-los, independentemente do gerenciador escolhido, é importante isolar responsabilidades.
Nosso projeto está bem organizado e separado em pastas. Em "components", temos todos os componentes mostrados no aplicativo. Em "models", constam os modelos com todas as informações que representam um produto. Em "screens", temos todas as telas da aplicação.

Para manter o padrão de isolamento de responsabilidades, vamos criar outra pasta, onde guardaremos apenas os estados que queremos gerenciar, isto é, variáveis e objetos.

Alguns gerenciadores seguem um padrão na nomeação de pastas. No nosso caso, dentro da pasta "lib", criaremos uma pasta chamada "store". Dentro dela, criaremos um arquivo chamado item_carrinho.dart, onde teremos a representação do contador, que é o valor que queremos alterar.

No novo arquivo, vamos criar uma classe chamada ItemCarrinho e declarar a variável valorContador, do tipo inteiro, inicializada com valor igual a zero:

class ItemCarrinho {
    int valorContador = 0;
}COPIAR CÓDIGO
Em seguida, vamos desenvolver as funções responsáveis por alterar o valor da variável. A função adicionaItem() incrementará valorContador, enquanto a função removerItem() removerá um item:

class ItemCarrinho {
    int valorContador = 0;
}

void adicionaItem() {
    valorContador++;
}

void removerItem() {
    valorContador--;
}COPIAR CÓDIGO
Assim, separamos em um arquivo o valor que queremos alterar e as funções responsáveis por essas alterações. Agora, basta transformar esse arquivo para poder utilizá-lo dentro do MobX.

O MobX é um gerenciador de estados muito famoso na comunidade Flutter, além de ser bastante utilizado no mercado de trabalho. Inclusive, existem pacotes do MobX para utilização com React. No próximo vídeo, vamos implementar nossas funções com MobX.

@@03
Para saber mais: aprofundando no MobX

Até aqui, vimos que precisamos implementar um botão de contador de produtos no app Pannuci! Para solucionar essa demanda, escolhemos o gerenciador de estados MobX.
Já sabemos que a função de um gerenciador de estados é organizar o fluxo de mudanças constantes e informações em um app, evitando um código caótico e erros de execução do app.

Existem vários gerenciadores no mercado, então, vamos aprofundar no MobX e entender o porquê o escolhemos!

O que é o MobX? Pra que ele serve?
De forma mais técnica, o MobX é uma biblioteca de gerenciamento de estados muito utilizada em aplicativos Flutter, React e React Native e está disponível para linguagens como Dart e Javascript.

Criada por Michel Wetstrate, essa ferramenta facilita a gerenciar estados e diminuir a complexidade do código, deixando ele mais organizado.

Quando um app é simples, é relativamente fácil lidar com as informações e estado.

Porém, quando a complexidade cresce, é preciso organizar o grande número de variáveis e estados e lidar com isso de uma forma que não prejudique a performance do aplicativo. Por exemplo, veja o número de cards e produtos do nosso contador.

É preciso saber lidar com eles de forma organizada e estratégica; se um aplicativo consome muita memória e exige muito da bateria de um dispositivo, significa que o código está mal otimizado, o que prejudica a credibilidade do produto.

Com o MobX, fica mais fácil lidar com o código.

Por que devo aprender o MobX?
Para aumentar o nível da sua carreira, pois o MobX é bastante utilizado nas empresas. Segundo o GitHub, mais de 15 mil pessoas utilizam esse gerenciador!

Imagem que mostra um print da página GitHub com o número de usuários do MobX, que totaliza quinze mil ponto dois mil pessoas

Outro fator importante é que MobX também é utilizado por frameworks JavaScript, como React e React Native.

Além disso, suas habilidades de programação vão dar um salto qualitativo e você saberá criar aplicativos com melhor desempenho, dado o código mais simplificado. Features simples podem se tornar um pesadelo de implementar sem um bom gerenciador, então é muito bom contar com a ajuda dessa ferramenta popular no mercado.

Qual o diferencial do MobX em relação a outros gerenciadores?
Uma característica única e relevante do MobX é a maneira como ele lida com estados: é uma biblioteca com passos muito bem definidos e declarados, permitindo um maior controle das variáveis/objetos alterados.

Um ótimo exemplo desse controle são os conceitos de observables (observáveis), actions (ações) e reactions (reações). Cada etapa pode ser escrita separada e chamada em diversas situações (por exemplo, quando apertamos um botão). Top, não é? O diagrama abaixo ilustra o funcionamento desses conceitos. Não se preocupe muito com isso no momento, veremos com calma como fazer isso ao longo do curso:

Imagem que mostra um triângulo na cor azul que representa os principais conceitos do MobX. No topo do triângulo, pode-se ler “*observables*” (observáveis); do topo para a base, sai uma flecha acompanhada da palavra “notify” (notificar). No canto inferior direito, há, em destaque, a palavra “Reactions” (reações) e, do lado direito, sai uma flecha com ícones coloridos de cinco estrelas e, acima delas, está escrito “side effects” (). Na base central do triângulo, uma seta para esquerda está acompanhada da palavra “fire” (disparar). No canto inferior esquerdo do triângulo, há, também em destaque, a palavra “Action” (ação). Subindo do canto inferior esquerdo para o topo do triângulo, há uma .

E as vantagens e desvantagens do MobX?
Simplicidade é bom demais: o MobX dá mais simplicidade na escrita e entendimento do projeto, gerando eficiência no projeto;
Uma boa fonte de pesquisa: a documentação é bem organizada e estruturada - o que facilita quando precisamos tirar uma dúvida;
Comunidade aquecida: como veio de outros frameworks JavaScript, a quantidade de comunidades e posts que falam sobre o MobX é bem extensa.
Vamos ser realistas: nem tudo são flores. Vejas desvantagens:

Que isso, meu? MobX não tem um gerenciador de eventos, ou seja, na hora de debugar a aplicação fica difícil de saber exatamente qual o evento que alterou o estado de alguma variável. Nós apenas somos notificados de que o estado mudou.
É ótimo, porém depende do caso: Batendo novamente nessa tecla, tudo depende do projeto e funcionalidades que você precisa implementar. Pode ser que você precise de funcionalidades que não estão presentes dentro do MobX ou a implementação no seu projeto atual requer muitas mudanças, entre várias outras motivações.
Abstração: O código do MobX é gerado automaticamente, o que simplifica nosso trabalho de escrever linhas de código mas ao mesmo tempo cria uma grande camada de abstração sobre sua funcionalidade. Fica muito difícil de compreender como exatamente o MobX trabalha com nossa aplicação.
Curti! Quero mergulhar mais fundo; como faço?
Clique aqui para acessar a documentação do MobX. Aproveite para explorá-la!

Bons estudos!

https://mobx.netlify.app/

@@04
Instalando o MobX no Flutter

Nosso próximo passo será implementar o MobX em nossa aplicação. Primeiramente, vamos consultar a documentação do MobX.
Na página inicial, há dados sobre os patrocinadores (sponsors), que dão suporte para o funcionamento dessa ferramenta, além de uma introdução sobre o MobX e depoimentos que pessoas que o utilizam. Na seção "Get Started", temos um link para o "Getting Started Guide" — vamos acessá-lo.

Nesse tutorial, entenderemos como funciona o MobX e como implementá-lo em nosso aplicativo. Como exemplo, ele utiliza um projeto com uma tarefa similar a nossa: um contador.

Na seção "Install Dependencies", especificam-se as dependências necessárias. Nós já comentamos sobre elas neste curso. Vale lembrar que a documentação pode ser atualizada, mas é interessante usar as versões recomendadas pelo instrutor anteriormente.

Na sequência, o tutorial indica a adição de uma store. Como comentamos, cada gerenciador de estados usa nomenclaturas distintas para isolar funcionalidades. Por isso, em aulas passadas, optamos pela criação de uma pasta chamada "store".

É interessante usar esse padrão no nome do arquivo também, então vamos alterar o nome de item_carrinho.dart para item_store.dart, já que será o store específico do item. Como regra, o nome do arquivo será o nome da classe, então vamos modificá-lo na primeira linha de ItemCarrinho para ItemStore:

class ItemStore {
    int valorContador = 0;
}

void adicionaItem() {
    valorContador++;
}

void removerItem() {
    valorContador--;
}COPIAR CÓDIGO
Resolvidas essas questões de nomenclatura, continuaremos a leitura da documentação. Na seção "Add a store", vamos analisar o primeiro bloco de código disponibilizado:

import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}COPIAR CÓDIGO
O primeiro passo é importar o MobX, porque utilizaremos uma função chamada part, que não existe no Flutter. O MobX gerará um arquivo, onde daremos uma série de instruções. Depois, o MobX criará outro arquivo contendo todas as funcionalidades que o Flutter necessita para que o gerenciador de estados funcione devidamente.

Algumas pessoas não acham interessante ter um mecanismo que gera arquivos automaticamente, elas preferem ter um controle maior do que é gerado no projeto e o que é feito dentro desses arquivos. No nosso caso, vamos escrever instruções simples e claras, permitir que o MobX crie esses arquivos, importá-los e deixar que a ferramenta faça os processos por nós. Ou seja, essa escolha depende do projeto e das preferências da pessoa desenvolvedora.

O arquivo gerado pelo MobX terá o mesmo nome do arquivo em que o colocamos, apenas com um .g antes de .dart. Na documentação, o exemplo é counter.g.dart. No nosso projeto, portanto, ele se chamará item_store.g.dart:

import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore {
    int valorContador = 0;
}

void adicionaItem() {
    valorContador++;
}

void removerItem() {
    valorContador--;
}COPIAR CÓDIGO
Na linha 7 do exemplo da documentação, temos uma classe com o nome do arquivo, cujo valor é outra classe privada e abstrata, que tem uma classe gerada pelo counter.g.dart (no caso da documentação). A classe privada é gerada nas linhas seguintes e recebe uma Store como mixin. Dentro dela, temos todas as variáveis e funções que precisamos para o gerenciador de estado.

Em nosso projeto, vamos inserir uma classe ItemStore que recebe a classe privada _ItemStore. Em seguida, transformaremos a ItemStore que criamos anteriormente em uma classe abstrata privada com um mixin de Store:

import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStore

abstract class _ItemStore with Store {
    int valorContador = 0;
}

void adicionaItem() {
    valorContador++;
}

void removerItem() {
    valorContador--;
}COPIAR CÓDIGO
Então, estamos importando a classe _ItemStore, que também deve ter o with _$ItemStore, que é algo específico do arquivo gerado pelo MobX:

import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStore with _$ItemStore

abstract class _ItemStore with Store {
    int valorContador = 0;
}

void adicionaItem() {
    valorContador++;
}

void removerItem() {
    valorContador--;
}COPIAR CÓDIGO
A IDE indicará um erro em _ItemStore, porque esse arquivo ainda não foi gerado. Faremos isso a seguir. Após salvar as alterações, abriremos o terminal e rodaremos o seguinte comando:

flutter pub run build_runner watchCOPIAR CÓDIGO
Temos a opção de rodar o build_runner apenas uma vez para gerar o _ItemStore, porém, usando o comando watch, o sistema ficará observando todos os stores. Caso alguma deles seja alterado, o build_runner gerará um novo arquivo e atualizar o aplicativo automaticamente.

Uma vez finalizado o processo, encontraremos um novo arquivo na nossa estrutura de arquivo. Em "lib > store", agora temos o item_store.g.dart. Nele, encontraremos o _$ItemStore que referenciamos em item_store.dart. Não vamos alterar esse arquivo.

Voltando ao arquivo item_store.dart, vamos reparar que não há mais indicação de erros. Nas próximas aulas, estudaremos os demais recursos que precisamos implementar para o funcionamento do MobX.

https://mobx.netlify.app/

https://mobx.netlify.app/getting-started

@@05
Entendendo e aplicando observáveis, ações e reações

Antes de prosseguir com o exemplo de código do MobX, estudaremos alguns conceitos importantes desse recurso. Na documentação, no menu lateral esquerdo, vamos acessar a seção "Core concepts".
Nessa página, temos um diagrama em formato de triângulo. No topo do triângulo, temos "Observables". No canto inferior direito, "Reactions". No canto inferior esquerdo, "Actions". O fluxo entre esses três elementos é mostrado por três setas, no sentido horário.

Observables são variáveis ou objetos que estão sendo observados por mudanças. Um ótimo exemplo é o contador em nosso projeto. Nós queremos observar esse valor e, caso haja mudanças, esperamos uma reação (reaction). No nosso caso, a reação é redesenhar o widget na tela.

Em resumo, quando o valor é modificado, o Flutter é notificado dessa mudança e a reação de redesenhar o widget com o valor atualizado será disparada.

Os observables são modificados através das actions, funções de modificar os observables. Em nosso projeto, são as funções adicionaItem() e removerItem() que alteram o valor do contador. Elas são as nossas actions.

Neste curso, vamos focar apenas em observables e actions, porque as reactions são um tema bastante extenso e teríamos conteúdo para este curso.

No menu à esquerda, vamos voltar para a seção "Getting Started" e continuar a analisar o bloco de código na seção "Add a Store":

import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}COPIAR CÓDIGO
Na linha 11, temos a anotação @observale. Esta é a maneira de indicarmos ao MobX que a variável seguinte é um observable. Similarmente, na linha 14, a anotação @action indica que a próxima função é uma action. É muito importante fazer essas anotações, pois será gerado no arquivo .g.dart.

Vamos inserir essas anotações em nosso código, transformando a variável valorContador em um observable e as funções em actions:

// ...

abstract class _ItemStore with Store {
    @observable
    int valorContador = 0;
}

@action
void adicionaItem() {
    valorContador++;
}

@action
void removerItem() {
    valorContador--;
}COPIAR CÓDIGO
Como usamos o watch ao executar o build_runner, o arquivo item_store.g.dart será atualizado automaticamente quando salvarmos as alterações. Com os observables e as actions configurados, podemos utilizá-los no contador.

O MobX não obriga que nosso widget seja um StatefulWidget, já que não usaremos mais o setState(). Em contador.dart, na linha 3, vamos substituir StatefulWidget por StatelessWidget:

class Contador extends StatelessWidgetCOPIAR CÓDIGO
Além disso, apagaremos da linha 5 até a 11, removendo também o valorContador. O arquivo ficará asim:

import 'package:flutter/material.dart';

class Contador extends StatelessWidget {
Contador({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
                if(valorContador > 0) {
                    valorContador--;
                }
            });
          },
          child: const Icon(Icons.remove_circle_outline, size: 20,),
        ),
        Text(valorContador.toString()),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
                valorContador++;
            });
          },
          child: const Icon(Icons.add_circle_outline, size: 20,),
        ),
      ],
    );
  }
}COPIAR CÓDIGO
Nós vamos utilizar o valorContador do store, então primeiramente precisamos importá-lo. Criaremos um final ItemStore:

// ...

class Contador extends StatelessWidget {
Contador({ Key? key }) : super(key: key);
  final ItemStore itemStore = ItemStore();

// ...COPIAR CÓDIGO
Agora, basta usar itemStore.valorContador no lugar de valorContador e remover as funções setState(). No botão de remoção, ficamos com o seguinte código:

// ...

InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        if(itemStore.valorContador > 0) {
                itemStore.removerItem();
        }
    },
    child: const Icon(Icons.remove_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
No Text, substituiremos valorContador por itemStore.valorContador. E no botão de adição, ficamos com seguinte código:

// ...

Text(itemStore.valorContador.toString()),
InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        itemStore.adicionaItem();
    },
    child: const Icon(Icons.add_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
Assim, em vez de usar valorContador++ ou valorContador--, aplicamos as nossas actions. Após salvar as alterações, vamos testar.

No emulador, ao clicar nos botões de adição e remoção, eles não funcionarão! Quando usamos o StatefulWidget, todo o widget será redesenhado, caso houver mudanças no setState(). Como não estamos mais utilizando o StatefulWidget, precisamos indicar ao Flutter que é necessário redesenhar um trecho do código.

Essa indicação pode ser feita com um widget chamado Observer, do Flutter MobX. Queremos redesenhar o contador e usar as funções de adição e remoção, então basicamente todo o código dentro do Row será observado.

Portanto, vamos envolver esse Row com um widget chamado Observer, incluindo a importação correspondente no início do arquivo:

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:panucci_delivery/store/item_store.dart';

class Contador extends StatelessWidget {
Contador({ Key? key }) : super(key: key);
  final ItemStore itemStore = ItemStore();

  @override
  Widget build(BuildContext context){
    return Observer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
                            if(itemStore.valorContador > 0) {
                                    itemStore.removerItem();
                            }
            },
            child: const Icon(Icons.remove_circle_outline, size: 20,),
          ),
          Text(itemStore.valorContador.toString()),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
                            itemStore.adicionaItem();
            },
            child: const Icon(Icons.add_circle_outline, size: 20,),
          ),
        ],
      ),
    );
  }
}COPIAR CÓDIGO
A IDE indicará um erro no Observer, porque devemos usar um builder em vez de child. Então, vamos inserir o builder, que é uma função anônima que precisa receber algum tipo de valor. Ele requer um context, mas como não estamos trabalhando com um, vamos passar apenas um underline. O retorno será o próprio Row:

// ...

return Observer(
    builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                    if(itemStore.valorContador > 0) {
                            itemStore.removerItem();
                    }
                },
                child: const Icon(Icons.remove_circle_outline, size: 20,),
            ),
            Text(itemStore.valorContador.toString()),
            InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                    itemStore.adicionaItem();
                },
                child: const Icon(Icons.add_circle_outline, size: 20,),
            ),
        ],
    ),
);

// ...COPIAR CÓDIGO
Após salvar, podemos testar. No emulador, ao clicar nos botões de adição e remoção do contador, a aplicação estará funcionando como esperado! A vantagem dessa abordagem em relação ao StatefulWidget é que, agora, podemos usar o contador em outros locais do nosso projeto, pois temos o controle dos estados dessa variável.

https://mobx.netlify.app/concepts

@@06
Observável ou ação?

Na pirâmide de conceitos do MobX, aprendemos sobre observables (observáveis) e actions (ações). Eles são muito importantes na hora de criar nosso arquivo store, que contém todas as informações necessárias para lidar com os estados da nossa aplicação.
mobx-triad-1024e4f4e0ff0ce3e27a2da8e36ab3a4.png

Sobre o que vimos, podemos corretamente falar que:

Selecione 2 alternativas

Actions são funções que alteram os estados das variáveis/objetos observáveis. Elas são chamadas, por exemplo, em botões dentro da função onTap()
Uma maneira que podemos criar uma ação é a seguinte:
void Action adicionaItem() {
    quantidadeDeItens++;
}
 
Alternativa correta
Observables são variáveis/objetos que são “observadas” e refletidas na interface da aplicação caso haja alguma mudança em seu estado. Uma maneira que podemos criar uma observável é a seguinte:
Observable quantidadeDeItens = 0;
 
Alternativa correta
Observables são variáveis/objetos que são “observadas” e refletidas na interface da aplicação caso haja alguma mudança em seu estado. Uma maneira que podemos criar uma observável é a seguinte:
@observable
int quantidadeDeItens = 0;
 
Isso mesmo! Para dizer ao MobX que uma variável precisa ser uma Observable, precisamos utilizar a notation @observable antes da sua declaração. Assim o MobX consegue gerar o novo arquivo com as informações necessárias.
Alternativa correta
Actions são funções que alteram os estados das variáveis/objetos observáveis. Elas são chamadas, por exemplo, em botões dentro da função onTap()
Uma maneira que podemos criar uma ação é a seguinte:
@action
void adicionaItem() {
    quantidadeDeItens++;
}
 
Perfeito! Para o MobX gerar o arquivo corretamente e também para que as funções alterem os valores observáveis, é importante utilizar a notation @action antes da declaração.

@@07
Para saber mais: aprofundando na programação reativa

Caso você queria saber mais sobre o que é programação reativa, confira nosso Alura+ sobre o assunto:

Se quiser saber um pouco, veja este em resumo (bem resumido):

Programação reativa é uma maneira de desenvolver aplicações sempre se preocupando com mudanças de variáveis/objetos de acordo com um modelo de negócios. Saber lidar com informações que pedimos, recebemos, tratamos e mostramos fazem parte da programação reativa.

@@08
Faça como eu fiz: implementando o contador de produtos com MobX

Hora da prática!
Agora é a sua vez de fazer o contador de produtos utilizando o MobX. Para fazer a implementação, é importante seguir alguns passos:

Transforme o widget de contador em Stateless widget;
Remova toda a implementação antiga com setState e a variável local valorContador;
Crie o arquivo de Store com as informações necessárias para o MobX gerar o arquivo;
Implemente a nova observável no contador, utilizando as ações para alterar seu valor;
Não se esqueça de rodar o comando no terminal flutter pub run build_runner watch para gerar o arquivo!
Vamos lá?

Caso queira conferir o resultado desta aula, você pode acessar o commit desta aula.
Bateu uma dúvida ou dificuldade? Chame a gente lá no fórum ou no discord!

Se quiser mais informações, você pode conferir os passos detalhados da implementação abaixo:

Passo 1: Transformar o contador em Stateless Widget
Primeiro, transforme o widget do contador em um Stateless widget;
Depois, remova a inicialização da variável local valorContador e todos os lugares que ela aparece;
Com nosso widget “limpo”, crie a Store de Item.
Passo 2: Criar o arquivo de Store
Para criar a Store, siga estes passos:

Crie uma pasta na raiz do projeto chamada store;
Em seguida, crie um arquivo chamado item_store.dart;
Faça o import (importação) do pacote mobx.dart no arquivo item_store.dart;
Na linha debaixo, utilize a chamada part passando o nome do arquivo que será gerado pelo MobX;
Para gerar o arquivo, o nome deve ser o mesmo do arquivo item_store.dart, mas com a adição da letra g antes da extensão dart: item_store.g.dart;
Na próxima linha, crie uma classe com o mesmo padrão do nome do arquivo: ItemStore. Essa classe deve receber uma classe privada de mesmo nome e com um mixin do arquivo que será gerado depois de rodar o build_runner.
class ItemStore = _ItemStore with _$ItemStore;COPIAR CÓDIGO
Crie a classe abstrata privada _ItemStore com um mixin de Store;
Dentro dessa classe, nós declaramos nossos observáveis e nossas ações;
Crie a observável com o inteiro valorContador inicializando-a com 0;
Crie duas ações: adicionaItem e removerItem;
O adicionaItem deve adicionar +1 para valorContador e o removerItem deve remover -1 do valorContador.
Passo 3: Implementar a nova observável no contador
Com a Store feita, crie uma instância dentro do widget do Contador (logo abaixo de seu construtor);
final ItemStore itemStore = ItemStore();COPIAR CÓDIGO
Agora, podemos acessar a nossa observável e nossas ações dentro do contador;
Coloque a variável valorContador na condição if onde antes era a variável local. A validação deve continuar a mesma;
Agora ao invés de chamar valorContador--, chame a nossa ação removerItem();
No widget de texto, apresente o valorContador da Store ItemStore;
E no último Inkwell, chame a ação adicionaItem();
Mas para que o MobX consiga redesenhar a tela, é importante utilizar o widget Observer();
O Observer recebe um argumento que é o builder:;
O builder precisa de uma função anônima que recebe um valor, mas como não vamos utilizar esse valor do builder, podemos passar utilizando apenas _;
O retorno desta função anônima deve ser todo o widget Row que engloba nossos Inkwells e Texts.
Passo 4: Gerar arquivo
Não se esqueça de rodar o comando flutter pub run build_runner watch para que o MobX possa gerar o novo arquivo!
Bons estudos!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/d10daf69b5e228a7307cb5295bee560133a90c36

@@09
O que aprendemos?

Nessa aula, você aprendeu como:
Entender o que é MobX e sua importância na construção de apps Flutter;
Compreender e utilizar os principais conceitos e técnicas de como funciona o MobX (observables e actions);
Organizar pastas e arquivos para separar as responsabilidades de gerenciadores de estado;
Construir a estrutura básica para lidar com variáveis/objetos mutáveis que precisam ser refletidos na tela;
Criar a estrutura básica do arquivo de Store para que o MobX consiga gerar um outro arquivo;
Avisar o MobX quais são as variáveis observáveis com a notation (ou decorator) @observable;
Mostrar para o MobX quais são as ações com a notation (ou decorator) @action;
Instanciar a Store dentro de um widget;
Pedir ao Flutter que redesenhe apenas um trecho específico de código com o widget Observer(), ganhando mais controle sobre o código e tornando o app mais eficiente.
Concluímos nossa segunda aula! Vejo você a seguir.

Bons estudos!