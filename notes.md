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

#### 27/11/2023

@03-Expandindo o MobX

@@01
Projeto da aula anterior

Você pode acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/archive/refs/heads/Aula2.zip

@@02
Desafio

Agora, lançarei um desafio para você: o nosso próximo passo é desenvolver o contador da sacola de compras, localizada na parte inferior do aplicativo.
Da mesma forma que fizemos o contador (item_store.dart), o desafio é criar o carrinho_store. Os requisitos deste arquivo são:

MobX;
"Part" para geração de arquivo;
Classe importada para a aplicação toda;
Classe privada e abstrata.
Esta última classe privada e abstrata deve conter:

Observables;
Actions (funções) de adicionar e remover um item do carrinho.
Você ainda não precisa implementar essa store na aplicação. O importante é exercitar o processo de gerar o arquivo e criar a estrutura básica de uma store com o MobX.

Após montar o carrinho_store, nos vemos no próximo vídeo!

@@03
Desafio: a Store do carrinho

Hora da prática!
Para saber a quantidade de itens no carrinho, nós precisamos atualizar o valor em tela no momento em que um item é adicionado. Para lidar com esses estados, é necessário criar uma Store do carrinho de compras.

Agora é a sua vez! Crie a Store do carrinho, implementando os observáveis e ações necessárias. Caso não saiba por onde começar, você pode conferir a item_store.dart, já que todos os conceitos vistos lá podem ser aplicados nessa nova Store.

Para criar a Store, basta seguir esses passos:

Crie um novo arquivo chamado carrinho_store.dart;
Faça o import do pacote do MobX;
Aponte o nome do arquivo que será gerado pelo MobX;
Crie uma observável do tipo inteiro que vai guardar a quantidade de itens no carrinho;
E depois crie as ações necessárias para adicionar um item e remover um item.
Neste primeiro momento, você não precisa implementar a Store no projeto, mas apenas criar sua estrutura.

Você pode conferir o resultado deste desafio através do seguinte commit.
Qualquer dúvida que você tiver sobre esse exercício, pode nos perguntar no fórum!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/1d9796c8840de67cab970043b38b8be8f30a2a64

@@04
Solucionando o desafio da Store do carrinho

Feito o desafio, é hora de conferirmos o resultado. Se você ainda não fez o desafio, agora é a sua chance de saber como criar o carrinho_store.
O primeiro passo é criar um novo arquivo na pasta "store" clicando sobre ela com o botão direito e selecionando "New File". O nome deste arquivo será carrinho_store.dart.

É importante lembrar que, dentro do Terminal, já estou rodando o build_runner no modo "watch". Se você ainda não fez isso, escreva o seguinte no Terminal:

flutter pub run build_runner watch
Isso permitirá que você observe as mudanças feitas na store.

Em seguida, importaremos o MobX escrevendo import 'mobx' e selecionaremos a opção package:mobx/mobx.dart da lista.

Atenção: o pacote a ser importado não é o "flutter_mobx", mas o "mobx". O primeiro foi usado nos widgets.
Após a importação, precisamos indicar qual arquivo será gerado: part 'carrinho_store.g.dart'. Caso você tenha alguma dúvida sobre como montar o arquivo, confira o processo que fizemos na outra store já montada neste curso.

Agora, criaremos a classe que receberá uma classe abstrata privada com o mixing da classe a ser gerada posteriormente:

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStoreCOPIAR CÓDIGO
Obteremos um erro porque estas classes ainda não existem. Vamos criá-las escrevendo, logo abaixo da linha anterior: abstract class _CarrinhoStore with Store{}.

Dentro desta classe abstrata, precisamos inserir as informações para que o MobX consiga gerar o arquivo. Primeiro, precisamos de uma variável que será observada a partir das mudanças que faremos na aplicação, ou seja, o observável.

Essa variável precisa da annotation @observable. Em seguida, podemos declarar um inteiro (int), já que contaremos a quantidade de carrinhos. Chamaremos a variável de quantidadeCarrinho, a qual será iniciada em zero.

Ainda dentro da classe abstrata, criaremos as duas ações que aumentarão e diminuirão a quantidade de itens no carrinho. Usaremos a annotation @action, escrevendo void e acrescentando o nome da função (adicionaCarrinho()). Em seguida, escreveremos quantidadeCarrinho++.

A segunda ação será a de remover, com a mesma estrutura. Acrescentaremos a annotation @action e escreveremos void na linha seguinte. Chamaremos esta ação de removeCarrinho() e escreveremos quantidadeCarrinho-- na última linha. A seguir o código completo:

abstract class _CarrinhoStore with Store{
    @observable
    int quantidadeCarrinho = 0;

    @action
    void adicionaCarrinho() {
        quantidadeCarrinho++;
    }

    @action
    void removeCarrinho() {
        quantidadeCarrinho--;
    }
}COPIAR CÓDIGO
Se estivermos com o build_runner watch rodando, o arquivo será gerado automaticamente após salvarmos as alterações. Assim, evitamos ter que voltar ao Terminal e rodar o arquivo novamente. Perceba que já foi criado um novo arquivo chamado "carrinho_store.g.dart" na pasta "store".

Agora, a classe CarrinhoStore não exibe mais erro por encontrar o arquivo carrinho_store.g.dart. O nosso próximo passo será implementá-lo no projeto. Vamos lá!

@@05
Carrinho é global

O nosso carrinho_store já está criado. Agora, a pergunta é: onde ele será usado e implementado?
O número que exibe a quantidade de itens no carrinho deve ficar na Home, ao lado do botão na parte inferior da tela que exibe o ícone da sacola de compras. É aqui que usaremos o nosso observável.

Já as ações ficarão no próprio botão de contador, abaixo de cada item disponível para compra. Assim, quando apertarmos o botão para adicionar ou excluir um item da sacola, a ação correspondente será executada.

Com isso, percebemos que será preciso usar o store em locais diferentes. No entanto, se compararmos ao que fizermos com o contador, perceberemos que uma única instância foi criada separadamente para cada item. Desse modo, nenhuma ação influenciará a de outro cartão.

Mas e se quisermos um valor global para a aplicação? Poderíamos usar um InheritedWidget e passar o store para cada widget utilizado. No entanto, existe uma maneira mais fácil e recomendável para lidar com essa situação: usando o Provider. O Provider é uma ferramenta recomendada para uso em conjunto com o MobX.

Se acessarmos o arquivo "pubspec.yaml", encontraremos a indicação da instalação do provider como uma dependência. Para prosseguirmos, é importante que esta dependência esteja instalada no seu projeto.

Por meio do Provider, conseguiremos criar este store globalmente e a nossa aplicação conseguirá utilizar essa mesma referência. Além disso, usaremos o Provider para transmitir as informações do carrinho a outras páginas. Assim, implementaremos o Provider com o MobX.


@@06
Implementando MobX e Provider

O próximo passo é implementar o Provider com o MobX. Lembrando que precisamos acessar a classe CarrinhoStore em toda a aplicação, pois ela será usada globalmente.
Para permitir isso, acessaremos o arquivo "main.dart", englobaremos o widget de Home com o Provider, passando o CarrinhoStore. Dentro dos colchetes de Widget build, substituiremos o trecho home: Home() por home: Provider(create: ()). O create será uma função anônima que deve receber algum contexto.

Como não usaremos um contexto por enquanto, podemos passar um underline (_) como parâmetro. Em seguida, usaremos uma arrow function (=>) para indicar o que será passado via Provider, ou seja, o CarrinhoStore(). Na sequência, indicaremos para quem as informações serão enviadas (o child), que corresponde à Home().

O resultado é o seguinte:

// Trecho de código suprimido

home: Provider(create: (_) => CarrinhoStore(), child: Home()),

// Trecho de código suprimidoCOPIAR CÓDIGO
Salvaremos estas alterações no arquivo "main.dart". Isso permite à Home receber o nosso CarrinhoStore. Abriremos o arquivo da Home em "screens > home.dart" e observaremos o texto que exibe a quantidade de itens presentes na sacola de compras ("0") na linha 59, inserida dentro dos parênteses de Padding().

É aqui que precisamos inserir o nosso observável. Mas, antes, receberemos o carrinhoStore dentro do Provider. Pressionaremos a tecla "Enter" para pular uma linha após Widget build e chamaremos final carrinhoStore = Provider.of(context).

Nessa hora, ocorrerá um erro indicando que Provider não foi importado. Para resolver o problema, clicaremos com o botão direito sobre Provider e selecionaremos a opção "import library 'package:provider/provider.dart'".

Importado o Provider, podemos passar um listen dentro dos parênteses de Provider.of() para indicar que queremos ouvir mudanças e mandá-las para toda a aplicação. Como não haverá mudanças no carrinhoStore, atribuiremos o valor false ao listen.

É importante também apontarmos o tipo de Provider que estamos recebendo. Assim, podemos atribuir o tipo <CarrinhoStore> a ele após o .of. Dessa forma, ele saberá como lidar com a informação recebida via Provider. É como se informássemos que o tipo do carrinhoStore a ser recebido é do tipo CarrinhoStore.

O resultado é o seguinte:

final carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);

Feito isso, voltaremos à linha que exibe o texto com o número de itens no carrinho e o substituiremos por uma interpolação ${} com carrinhoStore.

Agora, já temos acesso às funções e à variável de quantidade no carrinho. Então, escreveremos carrinhoStore.quantidadeCarrinho dentro das chaves. A linha completa ficou da seguinte forma:

${carrinhoStore.quantidadeCarrinho},

Salvaremos o arquivo "home.dart" e aparentemente tudo deu certo. Como ainda não implementamos as ações no contador, o valor do carrinho não será alterado na interface.

Agora, precisamos implementar as funcionalidades de adicionar e remover itens da sacola de compras no arquivo "contador.dart". Pressionaremos a tecla "Enter" para abrir uma nova linha após Widget build(BuildContext context){.

Repetiremos o código que digitamos em "home.dart": final carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);.

Do mesmo modo, importaremos o CarrinhoStore e o Provider clicando com o botão direito sobre cada um deles e selecionando, respectivamente, "import library '.../store/carrinho_store.dart'" e "import library 'package:provider/provider.dart'". Com isso, obtemos acesso ao carrinhoStore dentro do contador.

Dentro dos parênteses do primeiro InkWell, encontramos uma condicional if que possui um removerItem. Pressionaremos a tecla "Enter" para abrir uma linha logo abaixo dele e acrescentar: carrinhoStore.removeCarrinho().

No segundo InkWell, mais abaixo, abriremos uma nova linha abaixo de itemStore.adicionaItem() e escreveremos carrinhoStore.adicionaCarrinho().

Feito isso, salvaremos as alterações no arquivo "contador.dart" e faremos o teste na interface adicionando um item qualquer no carrinho. Nesse momento, a sacola não sofre nenhuma modificação. Isso ocorre porque não colocamos a widget de observer no MobX em "home.dart".

Por enquanto, só usamos a store, recebemos as suas informações, mas o widget ainda não está sendo observado. Falta indicar ao Flutter que alguns trechos de código precisam ser redesenhados na tela.

Para resolver o problema, voltaremos ao arquivo "home.dart" e desceremos no código até a linha que exibe child: InkWell dentro de SliverfillRemaining().

Aqui, temos duas opções: podemos envolver o SliderfillRemaining() ou envolver apenas o InkWell(). Não existe muita diferença entre as duas. Por isso, englobaremos o InkWell com um widget usando o atalho "Ctrl + ." e selecionando a opção "Wrap with widget".

O widget utilizado será o Observer, que vem do flutter_mobx. Na linha imediatamente acima ao InkWell(), substituiremos a palavra widget por Observer. O trecho ficará da seguinte forma:

// Trecho de código suprimido

alignment: Alignment.bottomCenter,
child: Observer(
    child: InkWell(

// Trecho de código suprimidoCOPIAR CÓDIGO
Poderemos observar que ele fez o import automaticamente no topo. Caso isso não tenha acontecido, é possível importar manualmente o pacote flutter_mobx.dart. Lembrando que este não é o mesmo pacote que o mobx.dart.

O Observer precisa receber um build. Por isso, substituiremos o child na linha logo abaixo por builder. Já o builder precisa receber uma função anônima com algum tipo de contexto.

Como não estamos usando contextos por enquanto, podemos utilizar um underline (_). Em seguida, passaremos uma arrow function para indicar que o que será buildado é o InkWell e o restante do código. O trecho atualizado ficou da seguinte forma:

// Trecho de código suprimido

alignment: Alignment.bottomCenter,
child: Observer(
    builder: (_) => InkWell(

// Trecho de código suprimidoCOPIAR CÓDIGO
Salvaremos o arquivo "home.dart" e perceberemos que, no emulador, a interface foi atualizada de modo que nenhum item esteja selecionado. No entanto, a sacola apresenta um número de itens diferente de zero.

Se adicionarmos ou excluirmos novos itens de Chicken Salad, a sacola modifica a quantidade como se já houvesse outros itens adicionados lá.

Isso nos mostra que, quando trabalhamos com estados, é importante reiniciar a aplicação. No entanto, não precisa ser um build novo. Podemos usar o botão "Hot Restart" (ícone de uma seta em forma de círculo), no canto superior direito da tela.

Se apertarmos o Hot Restart uma vez, o número ao lado do ícone da sacola voltará a ser zero. Acrescentando novos itens na sacola, observaremos que agora a contagem está correta.

Com isso, conseguimos implementar o nosso carrinho_store na Home e no nosso contador usando o Provider. Vejo você no próximo vídeo!

@@07
MobX e Provider?

Às vezes pode parecer estranho utilizar várias bibliotecas em conjunto ao invés de apenas uma.
Em nosso projeto, utilizamos o pacote Provider para resolver uma grande questão de estados que apenas o MobX não conseguiu resolver.

Qual é a principal vantagem de usar o Provider em conjunto com o MobX para solucionar o nosso problema?

Facilita o compartilhamento de estados em várias partes do código, pois não precisamos lidar com Inherited widgets.
 
Exatamente! Utilizando o Provider junto com o MobX, é possível compartilhar estados de forma mais fácil entre diferentes widgets e partes do aplicativo.
Alternativa correta
Aumenta o desempenho do aplicativo, pois escrevemos menos linhas de código.
 
Alternativa correta
Diminui o tamanho do código, pois o MobX gera os arquivos e nós não precisamos lidar com eles.
 
Alternativa correta
Torna o código mais legível, pois escrevemos menos linhas de código.

@@08
Para saber mais: MobX feat. Provider

Nesta aula, nos deparamos com um problema cuja solução mais simples e otimizada seria a utilização do Provider em conjunto com o MobX.
O Provider também é um gerenciador de estados muito utilizado e, geralmente, uma base importante para aprender os diversos gerenciadores em Flutter.

Um completa o outro!
O problema que nós encontramos é que apenas com o MobX, não conseguimos acesso global de todos os estados que existem na aplicação… e está tudo bem! Como já existem ferramentas consolidadas no mercado para resolver esse problema, o MobX se foca em resolver outras coisas - como os estados.

A ideia é que cada biblioteca resolva um problema específico sem interferir no trabalho da outra, mas, sim, complementando. Provider é utilizado também como gerenciador de estados, porém não é sua função principal.

Portanto, usamos aquilo em que o Provider é muito bom em fazer (a injeção de dependências) em conjunto com o que o MobX é excelente (lidar com estado).

Quero entender mais sobre Provider - como faço?
Se quiser saber mais, acesse este curso que trata especificamente do Provider.

Bons estudos!

https://cursos.alura.com.br/course/flutter-gerenciamento-de-estados-provider

@@09
Faça como eu fiz: implementando Provider no MobX

Hora da prática!
Agora é a sua vez de implementar a funcionalidade de carrinho dentro do projeto! Para fazer a implementação, é importante seguir alguns passos:

Primeira parte - Criando a store
Crie a nova Store chamada carrinho_store.dart;
Dentro de carrinho_store.dart, coloque as seguintes informações:
A variável inteiro observável quantidadeCarrinho;
As duas ações para incrementar e decrementar a observável quantidadeCarrinho;
Não se esqueça de rodar o comando no terminal flutter pub run build_runner watch para gerar o arquivo!
Segunda parte - Implementando o provider
No arquivo main.dart, implemente o Provider passando a nossa nova Store CarrinhoStore();
No arquivo home.dart, crie uma nova instância de CarrinhoStore() que estamos recebendo pelo Provider;
Com essa nova instância criada, substitua o texto “0” do widget que mostra a quantidade de itens no carrinho para utilizar a nossa observável quantidadeCarrinho;
Não se esqueça de “abraçar” todo o widget Inkwell com o widget Observer;
No arquivo contador.dart, crie uma nova instância de CarrinhoStore() que estamos recebendo do Provider;
Chame as duas ações de incremento e decremento nos devidos Inkwell;
Vamos lá?

Caso queira conferir o resultado desta aula, você pode acessar os seguintes commits:
Parte 1;
Parte 2.
Bateu uma dúvida ou dificuldade? Chame a gente lá no fórum ou no discord!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/1d9796c8840de67cab970043b38b8be8f30a2a64

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/ded9e61db93263beabf64bb312d682a63feaa218

@@10
O que aprendemos?

Nessa aula, você aprendeu como:
Reconhecer algumas limitações do MobX. Ou, melhor dizendo, reconhecer no que ele é bom de fazer (gerenciamento de estados) e quando podemos utilizar outra ferramenta;
Identificar possibilidades de integração com outras bibliotecas para solucionar problemas específicos, utilizando o melhor de cada uma;
Implementar o Provider em conjunto com o MobX para disponibilizar informações de forma global no app.
Concluímos nossa terceira aula! Vejo você a seguir.

Bons estudos!


#### 28/11/2023

@04-Incrementando o projeto

@@01
Projeto da aula anterior

Você pode acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/archive/refs/heads/Aula3.zip

@@02
Listas e MobX

Até o momento, salvamos apenas a quantidade de itens dentro da nossa sacola - e não quais os itens são realmente salvos na sacola.
O item é uma informação importante para fazer o cálculo do total da compra, ou seja, o quanto gastamos - já que as informações de preço estão contidas dentro do item.

Para passar essas informações para a página de checkout precisamos saber quais são os itens que selecionamos. Por isso, precisamos fazer algumas modificações no carrinho_store.dart.

Listando os itens da sacola
Em "lib > store > carrinho_store.dart", ao invés de salvar um inteiro com a quantidade de carrinho, vamos salvar uma lista de itens.

Por isso, vamos substituir a declaração da variável quantidadeCarrinho por uma lista do tipo Item que vai se chamar listaItem. Ela vai ser inicializada com uma lista do tipo Item vazia.

Agora, vamos fazer a importação automática de Item do arquivo item.dart da pasta "models".

carrinho_store.dart:
import 'package:mobx/mobx.dart';

import '../models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = <Item>[];

// código omitido…COPIAR CÓDIGO
Agora, no adicionaCarrinho() e removeCarrinho(), precisamos passar um item para saber qual item vai ser adicionado ou removido.

Por isso, a função adicionaCarrinho vai receber uma variável Item do tipo item como parâmetro. Ao invés de usar quantidadeCarrinho++, vamos usar listaItem.add(), passando nosso item.

Da mesma maneira, a função removeCarrinho() vai receber uma variável Item do tipo item como parâmetro. Ao invés de usar quantidadeCarrinho--, vamos usar listaItem.remove(), passando nosso item.

  @action
  void adicionaCarrinho(Item item) {
    listaItem.add(item);
  }

  @action
  void removeCarrinho(Item item) {
    listaItem.remove(item);
  }COPIAR CÓDIGO
Salvamos o arquivo carrinho_store.dart para gerar o arquivo de extensão g.dart. Caso você não tenha o build_runner watch rodando, o comando é:

flutter pub run build_runner watchCOPIAR CÓDIGO
Com isso, vai gerar novamente os arquivos toda vez que houver uma mudança dentro deles.

Contando os itens da lista
Agora que temos nosso listaItem conseguimos adicionar e remover um item. Porém, perdemos nosso contador. Com isso, não sabemos a quantidade de itens que temos… será?

Na verdade, podemos pegar o tamanho dessa lista. Toda vez que atualizamos a lista, seu tamanho será alterado.

Para isso, pegamos o length da lista e usá-lo como quantidade de valor para o nosso botão de ver carrinho.

Vamos começar com o nosso contador em "lib > componentes > contador.dart". Nosso contador está triste porque não tem um item para contar.

Contudo, na mesma pasta do widget de contador, temos o cartao.dart. O cartão já recebe um item, porque assim preenche com as informações de título do cartão, valor e imagem.

Como já recebemos essas informações, podemos simplesmente passar dentro do Contador() um item: item na linha 40 de cartao.dart. Depois, salvamos o arquivo.

cartao.dart:
class Cartao extends StatelessWidget {
const Cartao({ Key? key, required this.item }) : super(key: key);
final Item item;

  @override
  Widget build(BuildContext context){
    return Card(

// código omitido…

                  Contador(item: item),

// código omitido…COPIAR CÓDIGO
Porém, o nosso contador ainda não está pronto para receber esse item.

Vamos ao arquivo contador.dart dizer que o Contador precisa receber dentro do construtor, além da key, um required this.item.

Como ainda não temos um item, abaixo do final da linha 10, vamos criar um novo final de Item item.

Em seguida, vamos importar automaticamente o model de item.

contador.dart:
import '../models/item.dart';
import '../store/carrinho_store.dart';

class Contador extends StatelessWidget {
Contador({ Key? key, required this.item }) : super(key: key);
  final ItemStore itemStore = ItemStore();
  final Item item;

//código omitido…COPIAR CÓDIGO
Agora, nosso contador recebe um item. Porém, ainda precisa passar algumas informações para as funções de removeCarrinho() e adicionaCarrinho(). O que precisamos passar literalmente o item que acabamos receber.

Por isso, vamos passar item como parâmetro para removeCarrinho() na linha 26 e também para adicionaCarrinho() na linha 37.

  @override
  Widget build(BuildContext context){
    final carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);
    return Observer(

// código omitido…

            onTap: () {
              if (itemStore.valorContador > 0) {
                itemStore.removerItem();
                carrinhoStore.removeCarrinho(item);
              }

// código omitido…

            onTap: () {
              itemStore.adicionaItem();
              carrinhoStore.adicionaCarrinho(item);
            },

// código omitido…COPIAR CÓDIGO
Ainda temos um problema na home em "lib > screens > home.dart", porque se espera uma variável quantidadeCarrinho que não existe mais.

Na linha 64, vamos substituir quantidadeCarrinho pela listaItem.length. Com isso, temos agora o valor do tamanho dessa lista.

home.dart:
// código omitido…

                                      child: Text(
                                        "${carrinhoStore.listaItem.length}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: 
                                            Theme.of(context).colorScheme.onPrimary),

// código omitido…COPIAR CÓDIGO
Após salvar o arquivo de home, vamos resetar a aplicação, clicando no ícone "Restart" na barra de ferramentas no canto superior direito do VSCode. Atente-se, será um hot restart e não será um hot reload.

No emulador Android da aplicação, vamos adicionar dois "chicken salad" e 4 "cold noodles". Mas, a quantidade de itens na sacola de compra não é alterada.

Para verificar se existe algum problema, voltamos ao arquivo contador.dart. Dentro do botão de remover itens, vamos adicionar uma nova linha para fazer esse teste.

No nosso caso, na linha 27, vamos colocar um print() para observar o que acontece com o carrinhoStore.listaItem.length. Será que não é adicionado um item na lista?

contador.dart:
// código omitido…

            onTap: () {
              if (itemStore.valorContador > 0) {
                itemStore.removerItem();
                carrinhoStore.removeCarrinho(item);
                print(carrinhoStore.listaItem.length);
              }

// código omitido…COPIAR CÓDIGO
Após salvar o arquivo, vamos abrir o terminal e mudar a aba para "debug console". No emulador, a sacola já contém alguns itens. Adicionamos quatro "chicken salad" e depois removemos um "chicken salad".

I/flutter (12330): 12
I/flutter (12330): 11
Note que aparece o valor no debug console. No nosso caso, o valor sobe para 12 e depois desce para 11. Então, o que está acontecendo?

No próximo vídeo, vamos entender melhor o que é esse problema e como ele ocorre.

@@03
ObservableList

Vamos recapitular qual era o nosso problema. Colocamos uma função de print() dentro do nosso contador.dart para entender o que tem dentro da listaItem. Para verificar se a listaItem é realmente modificada quando adicionamos ou removemos um item do carrinho.
Porque, temos um problema na home, quando pegamos o valor da sacola através do listaItem.length dentro do carrinhoStore.

Reiniciamos a aplicação ao clicar no ícone de "Restart" na barra de ferramentas para zerar todos os estados. No emulador, adicionamos 8 "chicken salad" e depois removemos 1.

Dentro do "chicken salad" aparecem 7 itens, assim como no debug console do VSCode.

I/flutter (12330): 7
Então, por que a quantia da sacola não é alterada?

É uma resposta complexa relacionada a como a lista funciona e como o MobX repara nas mudanças que acontecem dentro do código.

Em carrinho_store.dart, a listaItem não está sendo realmente modificada.

Anteriormente, utilizamos a soma para a quantidade de itens. Isso significa que era somado mais 1 a um item que já tínhamos, ou seja, fazíamos uma reatribuição do valor daquela variável.

Agora, colocamos uma lista nova que contém um item novo. Em outras palavras, temos uma lista que já foi criada e instanciada e utilizamos uma função da própria lista para adicionar outro item dentro dela.

Com isso, a lista em si não foi modificada, pois não criamos uma nova instância e a atribuímos dentro da que já existe. Por isso, o MobX não consegue reconhecer que houve uma mudança dentro dessa lista e não consegue notificar o flutter sobre a alteração de valor da lista.

Lidando com listas no MobX
O que precisamos fazer é usar uma função específica do MobX para lidar com listas.

Na declaração de listaItem em "lib > store > carrinho_store.dart", ao invés de ser uma lista do tipo <Item> vazia, vamos passar um ObservableList().

Em seguida, passamos qual o tipo da lista na frente de ObservableList. No nosso caso, é uma lista de tipo <Item>.

carrinho_store.dart:
abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

// código omitido…COPIAR CÓDIGO
Com isso, o listaItem continua a ser uma lista, mas agora é uma ObservableList que o MobX presta atenção. Se não houver mudanças como a criação de uma nova instância ou atribuição, o MobX vai procurar por mudanças dentro da lista. Por exemplo, se existe um novo valor ou item. Dessa maneira, ele consegue notificar todo mundo que observa essa lista.

Após salvar o código, é preciso esperar para regerar o carrinho_store.g.dart. Podemos conferir as alterações dentro do terminal.

Vamos fazer um hot restart para reiniciar todos os estados da aplicação. No emulador, adicionamos três "chicken salad". Percebemos que a sacola volta a funcionar, pois o número à esquerda do ícone da sacola atualiza para 3.

Agora, a nossa sacola realmente adiciona itens. Não só o número dos itens, mas os itens. Dessa forma, podemos fazer contas e pegar o total da compra para mostrar dentro do "ver carrinho". Temos mais de liberdade para trabalhar com o carrinho_store.

@@04
Listas do MobX

Em nosso projeto, percebemos que era necessário solucionar um problema do aplicativo: os itens são adicionados no carrinho, no entanto, o valor total de itens continuava zero.
Vimos que esse problema poderia ser resolvido mexendo com listas.

Selecione as técnicas verdadeiras que praticamos nesta implementação:

Para atualizar listas com o MobX, podemos usar o seguinte código no arquivo de carrinho:
@observable
List<Item> listaItem = ObservableList<Item>();
Esse código inicializa a lista vazia de uma forma que o MobX consiga observar por mudanças no seu conteúdo.
 
É isso mesmo! Parabéns! Precisamos do ObservableList<Item>() para que o MobX consiga observar as mudanças.
Alternativa correta
Podemos usar o length para criar uma lista dinâmica com os produtos adicionados no carrinho. Esse length é responsável por armazenar o tamanho da lista, ou seja, o número de produtos pegos. Um exemplo desse código é:
List<Item> listaItem = List(Item item);

@action
void adicionaCarrinho(Item item) {
    listaItem.length++;
}
 
Na verdade length apenas devolve um valor inteiro com a quantidade de elementos dentro da lista.
Alternativa correta
Para atualizar listas com o MobX, podemos usar o seguinte código no arquivo de carrinho:
@observable
List<Item> listaItem = <Item>[];
Esse código inicializa a lista vazia. Em seguida, precisamos também passar length e Item nas funções de adicionar e remover produtos para que o MobX identifique a mudança na lista e atualize a tela.
 
Desta maneira, o MobX não consegue verificar se houve alguma mudança na estrutura da lista.
Alternativa correta
Para resolver o problema - o MobX não consegue identificar atualização na lista -, precisamos fazer duas coisas:
1) Passar um ItemStore nas funções adicionarCarrinho e removeCarrinho;
2) Inserir um @observable nessas duas funções para que o MobX fique sabendo da alteração da lista e atualize a tela.
 
Na verdade as funções adicionarCarrinho e removeCarrinho já são ações da ItemStore. Também não precisamos passar uma observável como parâmetro, já que as ações já alteram os valores de observáveis.

@@05
Computed

Para pegar a quantidade de itens dentro da nossa sacola, podemos utilizar outro tipo de observável chamado computed.
O computed observa por mudanças dentro da variável. Mas, em vez de precisar de actions para poder alterar o seu valor e estado, podemos utilizar como condição o estado de outros observáveis.

Observável condicional
Por exemplo, no arquivo carrinho_store.dart, temos o listaItem. Podemos dizer para atualizar o valor de outro observável toda vez que listaItem for modificado.

Para isso, depois da notation @observable, vamos adicionar a notation @computed.

Esse computed vai ser um inteiro chamado quantidadeItem, assim como nossa antiga variável. Ao invés de inicializá-lo com 0 e precisar de uma action para modificá-lo, vamos passar o listaItem.length através de uma arrow function.

Mas, para fazer essa atribuição, faltou uma palavra-chave. Devemos colocar a função get, após int e antes de quantidadeItem. Com isso, vamos pegar a quantidade de itens baseado na mudança do listaItem.length.

carrinho_store.dart:
abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @computed
  int get quantidadeItem => listaItem.length;

// código omitido…COPIAR CÓDIGO
É uma maneira mais fácil de pegar a quantidade de itens, afinal não precisamos criar inicializar uma quantidade de itens com valor zero para depois criar uma action para adicionar e remover a quantidade de itens. Só necessitamos criar um observável do tipo computed que observa por mudanças do listaItem.length.

Se o listaItem.length for modificado, será devolvido o valor novo e notificado todo o lugar que utiliza a variável quantidadeItem.

Isso é o que chamamos de observável condicional. A condição é a mudança de outros observáveis dentro da aplicação.

Vamos salvar o carrinho_store.dart e conferir a saída do flutter pub run build_runner no terminal para saber se terminou de fazer o build.

Agora, vamos até a linha 64 do arquivo home.dart. Vamos passar a nova variável quantidadeItem para carrinhoStore ao invés de passar o listaItem.length.

home.dart:
// código omitido…

                                      child: Text(
                                        "${carrinhoStore.quantidadeItem}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: 
                                            Theme.of(context).colorScheme.onPrimary),

// código omitido…COPIAR CÓDIGO
Após salvar a home, vamos fazer um hot restart da aplicação para zerar todos os estados da aplicação.

No emulador, adicionar 4 "chicken salad". O comportamento não é mudado, como esperado. Ainda conseguimos remover e adicionar itens.

A diferença é que com o jeito que fizemos nos poupamos de criar actions para adicionar e remover um item ao alterar o observável de quantidadeItem, pois usamos a condição da listaItem.length.

Para finalizar, vamos apagar a linha 27 do arquivo contador.dart para deixar o código mais limpo. Nela, tínhamos um print somente para verificar se o listaItem.length retornava alguma modificação.

contador.dart:
// código omitido…

            onTap: () {
              if (itemStore.valorContador > 0) {
                itemStore.removerItem();
                carrinhoStore.removeCarrinho(item);
              }

// código omitido…COPIAR CÓDIGO
Com isso, enceramos o nosso contador. O próximo passo será brincar com o computed e com as condições. Até o próximo vídeo.

@@06
Para saber mais: aprofundando no Computed

A observável do tipo computed é muito interessante e disponibiliza para nós ferramentas para lidar com mais de uma observável ao mesmo tempo. Ela também é conhecida como observável condicional e, nesse caso, ela tem algum tipo de retorno baseado em uma (ou mais de uma) observável. Ela até pode ser considerada uma função.
Veja o exemplo a seguir:

import 'package:mobx/mobx.dart';

part 'contato.g.dart';

class Contato = _ContatoBase with _$Contato;

abstract class _ContatoBase with Store {
  @observable
  String nome;

  @observable
  String sobrenome;

  @computed
  String get nomeCompleto => '$nome, $sobrenome';

}
COPIAR CÓDIGO
Neste exemplo, temos uma observável do tipo String chamada nomeCompleto. Em seguida, acessamos o seu valor, ou melhor, temos um retorno do seu valor através da palavra chave get antes do nome da variável. Então, podemos acessar seu valor em um widget de texto (por exemplo) como faríamos normalmente com qualquer outra observável.

As observáveis condicionais (computed) não precisam de ações para ter seu valor alterado. A condição de mudança da nossa variável nomeCompleto vem das mudanças da outras duas observáveis. Portanto, se alguma das variáveis nome ou sobrenome mudarem, a variável nomeCompleto terá seu valor atualizado e refletido na tela do dispositivo.

Muito legal né?! Se quiser saber mais sobre a observável condicional computed, você pode acessar a documentação oficial do MobX.

https://mobx.netlify.app/concepts#computed-observables

@@07
Deixando o carrinho dinâmico com Computed

Uma feature bem interessante que podemos implementar utilizando observáveis condicionais é fazer o botão de ver carrinho sumir quando não tiver nenhum item selecionado, isto é, dentro da sacola.
Essa funcionalidade impediria que a pessoa vá para a página de checkout sem nenhum item para pagar, por exemplo. Mas, como vamos fazer isso?

Observando se a lista está vazia
Precisamos criar uma nova observável do tipo computed no arquivo em "lib > store> carrinho_store.dart" após o primeiro computed.

É importante saber se o carrinho está vazio. Será que sim ou não? Por isso, vamos receber um booleano e compará-lo com o estado de algum outro observável. Nesse caso, também vai ser listaItem.

Para isso, após bool, vamos utilizar o get e chamar o observável de listaVazia, pois vamos queremos observar se a lista está vazia.

Vamos conferir se a lista está vazia com uma arrow function seguido do listaItem devolvendo isEmpty.

Não precisamos comparar se o length (tamanho) está zero, pois isEmpty retorna um booleano para verdadeiro caso esteja vazio, caso contrário é retornado falso.

carrinho_store.dart:
// código omitido…

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @computed
  int get quantidadeItem => listaItem.length;

  @computed
  bool get listaVazia => listaItem.isEmpty;

// código omitido…COPIAR CÓDIGO
Com isso, conferimos se a lista está vazia. Se a lista está vazia, nosso retorno para dentro do listaVazia vai ser true (verdadeiro), pois é uma afirmação verdadeira. É importante ter isso claro quando criamos a condição dentro da home.

Após salvar o arquivo carrinho_store.dart, já foi gerado um novo arquivo como podemos conferir no terminal.

[INFO] Succeeded after 185ms with 2 outputs (9 actions)
Já foi completado, podemos implementar agora dentro de "lib > screens > home.dart".

Mostrando InkWell se a lista não está vazia
Para fazer essa condição de quando criar o InkWell, podemos ir até a linha 42 do arquivo home.dart onde temos o Observer que tem o builder.

Lembre-se que para poder observar mudanças o observável precisa estar dentro de um widget Observer. Nesse caso, é o InkWell.

Queremos desenhar esse InkWell em uma condição específica - que é quando a lista não está vazia.

Depois do builder, vamos apertar "Enter" para que o InkWell fique em uma nova linha.

Em seguida, vamos criar um if ternário antes de InkWell. Para isso, digitamos a variável carrinhoStore, ponto, listaVazia. Com isso, vai ser retornado verdadeiro ou falso.

Queremos mostrar o InkWell caso a lista não esteja vazia. Então, antes de carrinhoStore, vamos acrescentar uma exclamação para informar que queremos o oposto. Ou seja, se a lista está vazia, não queremos mostrar o InkWell.

Com isso, podemos acrescentar um sinal de interrogação após listaVazia. Assim, se lista não está vazia, vai nos devolver o InkWell.

Se a lista está vazia, deve nos devolver um contêiner. Para isso, vamos até o fechamento do InkWell, onde está apontando um erro.

Após seu fechamento e antes da vírgula, ainda na mesma linha, vamos colocar o sinal de dois-pontos e retornar um Container().

home.dart:
// código omitido…

            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(
                  builder: (_) => 
                  !carrinhoStore.listaVazia ? InkWell(
                    onTap: () {

// código omitido…

                                ), // Text
                              ), // Align
                            ])), // Stack // Ink
                  ) : Container(), // InkWell
                ), // Observer
              ), // Align
            ) //SilverFillRemaining

// código omitido…COPIAR CÓDIGO
Vamos repetir o que foi feito. Criamos um if ternário logo no começo do InkWell para confirmar se a lista dentro do carrinhoStore está vazia.

Se sim, não queremos fazer nada e vai mostrar somente um contêiner. Mas, se a lista não estiver vazia, podemos imprimir o nosso InkWell.

Podemos salvar o home.dart e reiniciar todos os estados da aplicação com um hot restart.

Repare como o botão de InkWell não aparece mais no emulador, já que a lista começa vazia.

Para verificar o funcionamento, vamos adicionar 1 "chicken salad". Com isso, o botão vermelho "ver carrinho" aparece novamente na parte inferior do app. Se retiramos todos os itens do carrinho novamente, o botão volta a desaparecer.

Tudo isso fizemos com a utilização das nossas observáveis condicionais do tipo computed.

Nosso próximo passo é calcular o total da nossa compra, utilizando todos os itens disponíveis. Até o próximo vídeo.

@@08
Computed

Com a utilização do MobX, as pessoas desenvolvedoras podem utilizar o @computed para melhorar a performance de suas aplicações.
Como você viu, o @computed é uma função que retorna um valor calculado a partir de observáveis, e é muito útil quando precisamos fazer cálculos ou operações complexas com os dados observados. Ele também é conhecido como observável condicional.

Qual das alternativas abaixo explica melhor o @computed?

Uma função que permite a criação de novas variáveis observáveis.
 
Alternativa correta
Uma função que retorna um valor observável que pode ser atualizado.
 
O @computed retorna um valor que pode ser utilizado como qualquer outra variável, mas o retorno é um valor e não uma observável. O seu valor só é atualizado se as observáveis dentro dela são alterados.
Alternativa correta
É uma função que atualiza automaticamente os dados observáveis com os quais está relacionada.
 
O @computed não atualiza automaticamente os dados observáveis, mas é atualizado automaticamente pelo MobX quando alguma variável observável dentro dela é atualizada.
Alternativa correta
Uma função que retorna um valor a partir de uma ou mais observáveis.
 
O @computed é muito utilizado para devolver valores que dependem de outras observáveis, como, por exemplo, calcular valor total de compras de uma lista de itens sem precisar alterar alguma observável.

@@09
Faça como eu fiz: listas e computed

Hora da prática!
Agora é a sua vez de implementar as seguintes funcionalidades dentro do projeto:

Uma lista de itens que será preenchida com os itens adicionados ao carrinho;
Uma observável condicional para saber a quantidade de itens dentro do carrinho;
Uma observável condicional para mostrar ou esconder o botão de “ver carrinho” na parte inferior da aplicação.
Para fazer a implementação, é importante seguir alguns passos:

Parte 1 - A Store
Dentro do arquivo carrinho_store.dart crie a observável listaItem que deve receber uma ObservableList do tipo Item;
Altere as ações de incrementar e decrementar a variável quantidadeCarrinho para adicionar ou remover um item da lista listaItem;
Altere o nome da variável quantidadeCarrinho para quantidadeItem e a transforme em uma observável condicional (computed);
O retorno da observável condicional quantidadeItem deve ser o tamanho da lista listaItem;
Crie uma outra observável condicional chamada listaVazia que deve retornar um bool caso a lista esteja vazia ou não.
Parte 2 - Implementando as mudanças
Passe o objeto Item para dentro do widget de Contador;
Dentro do contador forneça o Item para as ações que precisam de um item para adicionar à lista;
Na Home troque a variável quantidadeCarrinho para utilizar quantidadeItem, nossa nova observável condicional;
Ainda na Home, crie um if ternário que verifica o valor dentro da observável condicional listaVazia. Caso a lista esteja vazia, devolva um widget Container vazio. Caso a lista tenha algum item, devolva o Inkwell inteiro de “ver carrinho”.
Vamos lá?

Caso queira conferir o resultado desta aula, você pode acessar os commits de cada vídeo:
Vídeo 1 - Listas e MobX;
Vídeo 2 - ObservableList;
Vídeo 3 - Computed;
Vídeo 4 - Listas e computed.
Bateu uma dúvida ou dificuldade? Chame a gente lá no fórum ou no discord!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/099569427844478efac7484731ef94afb7b999cd

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/6787af2b1e96941b0f613600658c10d5210ec3d0

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/597969a4f7c594be4e56b2c6756e481c62d4a0cd

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/b345f6c64618a50cda3edaa25f79cfee864eb448

@@10
O que aprendemos?

Nessa aula, você aprendeu como:
Lidar com listas observáveis e as diferenças de uma lista comum;
Entender observáveis condicionais e quais as suas funções;
Criar e implementar observáveis condicionais para conferir quantidade de itens e criar interações com a pessoa usuária.
Concluímos nossa quarta aula! Vejo você a seguir.

Bons estudos!

#### 29/11/2023

@05-Refinando o projeto

@@01
Projeto da aula anterior

Você pode acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

@@02
Fazendo a soma dos produtos

Anteriormente, aprendemos a criar observáveis condicionais com computed e fizemos uma feature em que um botão na parte inferior da aplicação de "Ver carrinho" só irá aparecer caso exite algum item na sacola.
Na aplicação sem nenhum item selecionado, o botão não aparecerá, mas assim que adicionarmos algum, conseguiremos vê-lo.

Desta forma, evitaremos que a pessoa usuária vá para a página de checkout sem ter nada para comprar de fato.

Porém, quando adicionamos um ou vários itens, o valor da soma não estará realmente somando a quantidade de produtos no carrinho. Então, nossa próxima feature será lidarmos com essa soma.

Essa é uma responsabilidade do carrinho_store.dart, que é onde termos todas as informações do carrinho de compras.

Criaremos uma nova observável que será o valor total da compra, afinal queremos observar essa mudança e atualizar na tela. Após o @observable que contém a lista, criaremos outro com o tipo double chamado totalDaCompra e o inicializaremos com zero.

Ele será observado na home, e precisaremos de uma action para alterarmos o valor. Ao final do código, após a última @action de removeCarrinho(), criaremos uma nova que não terá retorno, então será void com o nome atualizaTotalDaCompra.

A variável totalDaCompra precisará ser atualizada em um momento específico, que é justamente quando adicionamos ou removemos um item do carrinho.

A primeira coisa é fazer com que totalDaCompra comece zerada com 0, mesmo já tendo inicializado com zero. Como há várias maneiras de resolver esse problema, começaremos exibindo este 0 aparecendo na tela assim que abrirmos a aplicação, e depois atualizaremos com o que há dentro da lista.

Pois quando removemos ou adicionamos algo à lista, alteramos a estrutura dela. Poderíamos subtrair o valor do item removido do total da compra já existente ou algo parecido.

Mas iremos zerar tudo o que existe dentro de totalDaCompra e faremos a somatória novamente, garantindo que a lista esteja consistente e atualizada.

O próximo passo será iterar na lista usando for() recebendo var i igual a 0, enquanto i for menor que listaItem.lenght, o i será somado ao final de cada iteração.

Dentro, faremos totalDaCompra sendo mais e igual += a listaItem na posição de [i], pegando o preco. Desta forma, pegaremos todos os itens da lista e somaremos, mas ainda não estamos usando em nenhum lugar.

Poderemos usar exatamente onde o valor sera atualizado, ou seja, em adicionaCarrinho onde chamaremos atualizaTotalDaCompra. Já na @action seguinte, adicionaremos atualizaTotalDaCompra().

//código omitido

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @observable
  double totalDaCompra = 0;

//código omitido

  @action
  void adicionaCarrinho(Item item) {
    listaItem.add(item);
    atualizaTotalDaCompra();
  }

  @action
  void removeCarrinho(Item item) {
    listaItem.remove(item);
    atualizaTotalDaCompra();
  }

  @action
  void atualizaTotalDaCompra() {
    totalDaCompra = 0;
    for(var i = 0; i < listaItem.length; i++){
      totalDaCompra += listaItem[i].preco;
    }
  }
}COPIAR CÓDIGO
Assim, atualizaremos toda vez que um produto for adicionado ou removido.

Salvaremos o arquivo e, se já tivermos o Build Runner rodando, geraremos automaticamente o carrinho_store.g.dart. Caso ainda não tenhamos rodado com build_runner watch, bastará aplicarmos o comando:

flutter pub run build_runner watchCOPIAR CÓDIGO
Assim, poderemos usar atualizaTotalDaCompra() dentro de home.dart onde está o botão "R\$ 00,00" que possui o valor total.

Substituiremos essa string pela interpolação de ${} chamando a variável carrinhoStore.totalDaCompra. Usaremos valores decimais com a função toStringAsFixed() recebendo o total de casas 2 e salvaremos.

//código omitido

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);
    final BuildContext homeContext = context;
    return SafeArea(
                ),

//código omitido

                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "R\$ ${carrinhoStore.totalDaCompra.toStringAsFixed(2)}",

//código omitido

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}COPIAR CÓDIGO
No emulador, veremos o valor atualizado e, como carrega automaticamente, o valor estará zerado. Se não, usaremos hot start para zerarmos os estados da aplicação.

Testaremos adicionando e removendo alguns itens e observando se os valores das somatórias estão corretos.

A seguir, enviaremos todas as informações da sacola e o total da compra para a página de check-out.

@@03
Passando informações para a tela de checkout

Já temos todas as informações do nosso pedido salvas no carrinho, e o total da compra calculado no botão de "var carrinho" na parte inferior da tela.
O próximo passo será reunir esses dados dos itens e enviar para a página de checkout. No home.dart, como este botão é um InkWell, dentro da função onTap: () em Observer na linha 45, poderemos utilizar um Navigator para mandarmos as informações.

Usando .push(), usaremos o context e o MaterialPageRoute() que lidará com a rota. Como pede um builder:, passaremos uma função anônima e, como retorno, passaremos a página Checkout().

//código omitido

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

//código omitido

            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(
                  builder: (_) => 
                  !carrinhoStore.listaVazia ? InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Checkout();
                      }));
                    },

//código omitido

              ),
            )
          ],
        ),
      ),
    );
  }
}COPIAR CÓDIGO
Salvaremos e veremos a mudança na tela.

Ao clicarmos em "ver carrinho", iremos para a página de checkout que está vazia e com valor zerado apesar de termos selecionado itens.

De volta ao código, iremos ao checkout.dart e importaremos o provider recebendo carrinhoStore. Na primeira linha das chaves abaixo de Widget build(), escreveremos final CarrinhoStore carrinhoStore sendo igual a Provider.of passando o tipo <CarrinhoStore>(context);.

Por fim, passaremos o listen para não "ouvirmos" outras mudanças que acontecem dentro do CarrinhoStore, então será false.

//código omitido

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarrinhoStore carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);

//código omitido
  }
}COPIAR CÓDIGO
Vamos adicionar as informações dentro da aplicação de checkout.dart.

Onde temos a lista que será gerada em SilverList(), que será cada um dos itens em OrderItem(). Pedirá um item que é CarrinhoStore.listaItem[] com a posição do index.

Por enquanto está com placeholder de 1 em childCount:, mas queremos que seja a quantidade real de itens da lista. Então substituiremos por carrinhoStore.listaItem.lenght.

Por fim, iremos ao SliverToBoxAdapter() com o componente PaymentTotal() contendo o valor total da compra. Utilizaremos a interpolação novamente que receberá apenas um double e não uma string.

Então total: será carrinhoStore.totalDaCompra que já fará o próprio toFixed.

//código omitido

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override

//código omitido

              SliverToBoxAdapter(child: PaymentTotal(total: carrinhoStore.totalDaCompra),),
              SliverFillRemaining(

//código omitido

              )
            ],
          ),
        ),
      ),
    );
  }
}COPIAR CÓDIGO
Salvaremos o arquivo e receberemos um grande alerta de exceção.

O problema é justamente no context. Traduzindo, a mensagem diz:

Isso aconteceu porque você usou um BuildContext que não inclui o Provider escolhido.
Como tudo depende do context, devemos nos perguntar qual é o contexto em que estamos trabalhando.

Se voltarmos ao botão próximo à linha 48 no home.dart, estamos passando um context para dentro do Navigator, o qual é diferente do que passamos dentro do MaterialPageRoute(), como a própria IDE alerta.

Se clicarmos nesta palavra context, outros lugares que também o utilizam irão se destacar, menos o que está dentro MaterialPageRoute(). Afinal, este contexto é o novo da página de checkout.

Resolveremos isso passando o context da página home para dentro do nosso widget checkout. Onde temos o <CarrinhoStore>, criaremos um novo final BuildContext chamado homeContext para sabermos exatamente qual é o contexto utilizado. Em seguida, chamaremos context que é o mesmo da aplicação da página inicial.

Em seguida, passaremos o homeContext para dentro da página de Checkout(). Depois criaremos esta variável dentro da página, então estamos nos antecipando. Ele será também o homeContext.

//código omitido

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);
    final BuildContext homeContext = context;

//código omitido

            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(
                  builder: (_) => 
                  !carrinhoStore.listaVazia ? InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Checkout(homeContext: homeContext);
                      }));
                    },

//código omitido

              ),
            )
          ],
        ),
      ),
    );
  }
}COPIAR CÓDIGO
Já em checkout.dart, dentro do construtor da página de checkout após a key, da linha nove, receberemos required this.homeContext.

Na linha seguinte, escreveremos final BuildContext sendo homeContext. Com isso, a instância de homeContext irá para a home e conseguiremos utilizar do Provider e dizer qual o contexto que estamos usando.

Ainda, dentro do Provider, temos que passar o contexto da home no lugar certo. Onde já passamos o context, substituiremos por homeContext.

//código omitido

class Checkout extends StatelessWidget {
  const Checkout({Key? key, required this.homeContext}) : super(key: key);
  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    final CarrinhoStore carrinhoStore = Provider.of<CarrinhoStore>(homeContext, listen: false);

//código omitido
  }
}COPIAR CÓDIGO
Salvaremos o arquivo e daremos um hot restart para analisarmos as mudanças no emulador, adicionando itens ao carrinho e indo à página de "Pedidos".

Já temos as imagens, valores e quantidades exibidas corretamente. Mais abaixo, na parte inferior da tela em "Confirmar", temos o valor total da compra.

Se retornarmos à página inicial, o total das compras continuará sendo igual ao que temos na página de checkout.

@@04
Entendendo os dois contexts

Durante o desenvolvimento da nossa aplicação, tivemos que passar informações da Store de uma página para outra. As informações da Store estavam sendo fornecidas para toda a aplicação através do Provider.
No entanto, encontramos um problema na hora de chamar a Store dentro da página de Checkout: não recebemos as informações que estão dentro da Store do carrinho.

Escolha a alternativa que melhor descreve qual é o problema e como podemos solucionar:

Quando usamos um Navigator para criar uma nova rota, um novo context é gerado. Esse novo context precisa ser passado para o Provider como uma lista de contexts que ele tem acesso.
Para resolver o problema, podemos passar o context da Home e o context da página de Checkout no momento em que criamos o Provider.
 
Alternativa correta
Quando usamos um Navigator para criar uma nova rota, o context é passado para a função anônima. Mas esse context não é passado para a tela de Checkout.
Para resolver o problema, podemos passar o context da função anônima como parâmetro da página de Checkout.
 
Alternativa correta
Quando usamos um Navigator para criar uma nova rota, um novo context é gerado. Esse novo context não tem acesso ao Provider com a Store.
Para resolver o problema, podemos passar o context da Home como parâmetro da página de Checkout.
 
Tudo depende do contexto! Essa é uma solução válida para resolver o conflito de contextos gerado pelo Navigator.
Alternativa correta
Quando usamos um Navigator para criar uma nova rota, um novo context é gerado com o mesmo nome do contexto da página atual. Para evitar conflitos, o Flutter troca o valor de referência.
Para resolver o problema, podemos trocar o nome do novo context gerado para algo diferente e utilizar esse novo valor na chamada do Provider na tela de Checkout.

@@05
Faça como eu fiz: total da compra e navegação

Hora da prática!
Agora é a sua vez de implementar as seguintes funcionalidades dentro do projeto:

Calcular o total da lista de compras e mostrar no botão de “ver carrinho”;
Passar todas as informações do carrinho para a página de checkout.
Para fazer a implementação, é importante seguir alguns passos:

Parte 1 - O total
Crie uma nova observável totalDaCompra e inicialize ela com 0;
Adicione uma nova ação que itera sobre a listaItem e soma os valores de cada item no carrinho;
Chame essa nova ação dentro das ações de adicionar e remover um item do carrinho;
Mostre essa observável no botão de “ver carrinho”.
Parte 2 - A tela de checkout
Dentro da tela Home, pegamos o BuildContext e guardamos em uma variável chamada homeContext;
Chamamos o Navigator dentro da função onTap do InkWell e passamos dentro da página de Checkout o nosso homeContext;
Na página de Checkout, receba o homeContext dentro de seu construtor;
Crie a variável do tipo BuildContext que recebe o contexto do construtor;
Instancie um CarrinhoStore com o Provider, passando como context o homeContext que recebemos no construtor;
Adicione como retorno do widget SliverChildBuilderDelegate o widget OrderItem passando um carrinhoStore.listaItem[];
Ainda no SliverList, passe dentro do childCount a observável quantidadeItem;
Obs: Em vídeo foi utilizado carrinhoStore.listaItem.length no lugar de quantidadeItem. Ambos funcionam, mas o ideal é utilizar quantidadeItem.
Por último, dentro do widget PaymentTotal passe a observável totalDaCompra.
Vamos lá?

Caso queira conferir o resultado desta aula, você pode acessar os seguintes commits:
Parte 1;
Parte 2.
Bateu uma dúvida ou dificuldade? Chame a gente lá no fórum ou no discord!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/6b5abb90f040599130e1f722ee2a185560772831

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/commit/b46e8e6ff0c18895d01b7d78e892f57a3bd7bc49

@@06
Projeto final

Você pode baixar ou acessar o código-fonte do projeto final.
Aproveite para explorá-lo e revisar pontos importantes do curso.

Bons estudos!

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/archive/refs/heads/Aula5.zip

@@07
O que aprendemos?

Nessa aula, você aprendeu como:
Criar ações mais complexas e como integrar com outras ações, no caso;
Reconhecer que limitações de bibliotecas não são problemas, mas formas de facilitar a inclusão de apenas as bibliotecas necessárias para resolver nosso problema;
Utilizar Provider em conjunto com MobX para gerenciar estados em toda a aplicação.
Concluímos nossa quinta e última aula! Vejo você a seguir.

Bons estudos!

@@08
Recados finais

Parabéns, você chegou ao fim do nosso curso. Tenho certeza que esse mergulho foi de muito aprendizado.
Após os créditos finais do curso, você será redirecionado para uma tela na qual poderá deixar seu feedback e avaliação do curso. Sua opinião é muito importante para nós.

Aproveite para conhecer a nossa comunidade no Discord da Alura e se conectar com outras pessoas com quem pode conversar, aprender e aumentar seu networking.

Continue mergulhando com a gente! 🤿

https://discord.com/invite/QeBdgAjXnn

@@09
Conclusão

Parabéns! Você chegou ao final deste curso de MobX da Plataforma Alura!
Neste projeto, adicionamos itens à página inicial de uma aplicação mobile e, ao clicarmos em "+", seu valor e quantidade irão aparecer na parte inferior da tela, em um botão vermelho de "ver carrinho".

Caso não tenhamos selecionado nada, o botão desaparecerá. Adicionando alguns itens, conseguiremos clicar neste botão e nos direcionar para a página de checkout com o título "Pedido", onde teremos todas as informações da sacola de compras.

A somatória dos valores dos itens aparecerá atualizada também ao final da lista.

Aprendemos o que é MobX, os principais conceitos e técnicas para utilizarmos em nossa aplicação, trabalhamos com os @observables de @computed, que são os condicionais.

Também abordamos sobre as @actions que são funções que modificarão estes @observables, além de formas de implementarmos com Provider dentro de outas telas para termos acesso global de todos os valores da aplicação.

Vimos as vantagens que os gerenciadores de estados trazem, que facilita bastante nosso trabalho com variáveis mutáveis que precisam ter seus valores refletidos na tela.

Convidamos a participar da nossa comunidade no Discord para interagir com outras pessoas, participar de eventos, compartilhar conhecimentos e tirar dúvidas.

Até o próximo curso!

@@10
Créditos
PRÓXIMA ATIVIDADE

 Apoio ágil
Cássio Murilo
Apoio didático

Christian Rosa
Denize da Silva Dias Cruz
Mayra de Oliveira
Instrutor

Matheus Alberto
Produção audiovisual

Vinicius Corrêa (Hide)
Ariana Brito
Samuka
Fabricio Andreotti
Transcrição

Bruna Gonçalves
Nyerik Scarmeloto