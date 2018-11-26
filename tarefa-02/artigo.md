### Tarefa 02

Bruno Freire e Vinicius Teixeira

# Go Language

### Origens

A linguagem Go nasceu nos escritórios do Google, em 2007, como um projeto interno em resposta a alguns problemas de infraestrutura enfrentados pela empresa na hora de desenvolver sistemas mais complexos. Rob Pike, Ken Thompson e Robert Griessemer foram os responsáveis pela criação da linguagem e iniciaram o desenvolvimento de tempo parcial. Houveram tentativas frustradas de resolver esses problemas com linguagens já existentes (Java, C++, Python), mas apesar de cada uma dessas linguagens possuírem características desejáveis, o principal era ter todas essas características em apenas uma linguagem.

Em 2008, Go passou de um projeto de tempo parcial para um projeto de tempo integral no Google, e com isso, muitos outros engenheiros participaram, além dos fundadores. Em 2009, Go se tornou Open Source e em 2010, começou a ser adotada por desenvolvedores de fora do Google.

Poucos dias após o lançamento da linguagem, Fancis McCabe, desenvolvedor da linguagem chamada Go!, solicitou uma mudança de nome da linguagem do Google, para evitar confusões. McCabe criou Go! em 2003, mas não registrou o nome. O tópico de problema aberto sobre o assunto foi fechado por um desenvolvedor do Google em 12 de outubro de 2010 com o status personalizado "Unfortunate" e com o seguinte comentário: "há muitos produtos e serviços de computação chamados Go.

Atualmente está na versão Go 1.11 (August 2018) e diversas empresas, como Amazon, YouTube, Docker, utilizam essa linguagem.

### Influencias

Algumas linguagens serviram de influência para a Go Lang como: C++, Python, Java e diversas outras linguagens.  O objetivo de se espelhar nessas linguagens era trazer características importantes para trabalhar com a infraestrutura Google, como: linguagem compilada, garbage-collector, estaticamente tipada, lidar com concorrência, síntaxe simples, dentre outras que foram reunidas nesta nova linguagem denominada Go!

Embora GoLang tenha se espelhado em diversas linguagens para absorver suas características, muitas funcionalidades vistas nessas linguagens ficaram de fora. São elas: tratamento de erro, herança, generics, assertions, sobrecarga de métodos.

### Classificação e Tipagem

Go é uma linguagem compilada como JAVA e C#, mas possui uma compilação bem rápida que superará as linguagens que são interpretadas ou rodam em máquinas virtuais. Forte e estaticamente tipada (a amarração das variáveis não pode ser alterada durante a execução). Possui orientação a objetos: o Go não possui classes como JAVA, mas possui tipos. A linguagem utiliza estruturas e métodos que funcionam de forma bem parecida com as classes de outras linguagens, além do uso de Interfaces (uma característica da Orientação a Objetos de Go).

Se fossemos resumir Go em duas palavras seriam: simplicidade e performance. A razão desta linguagem ser criada é que os autores queriam uma linguagem que fosse fácil de programar e com alta capacidade de performance. Diferente de C e C++ que possuem performance, porém complexidade de desenvolvimento.

O Go tenta combinar a facilidade de uma linguagem de programação interpretada e dinamicamente tipada (Javascript e Python), com a eficiência e segurança de uma linguagem de programação estaticamente tipada (C e C++). É possível observar isso em alguns aspectos, como por exemplo a inferência de tipos.

<pre><code>var(
	name string
	age int
	location string
)

Sem Inferência</code></pre>

<pre><code>var(
	name = "T'Chala"
	age = 33
	location = "Wakanda"
)

Com Inferência</code></pre>

Neste exemplo, ambos formatos de declaração de variáveis resultarão nos mesmos tipos. Observando a imagem é possível notar que no primeiro formato os tipos estão sendo definidos explicitamente. Já no segundo formato, o valor é atribuído diretamente, sem a necessidade da especificação do tipo (muito semelhante às linguagens dinamicamente tipadas).


### Características

 - Compilada (Goroutines)
 - Garbage-Collected
 - Tem seu próprio Go Runtime
 - Sintaxe Simples
 - Excelente pacote padrão
 - Multiplataforma
 - Orientada a Objetos (sem herança)
 - Estaticamente e fortemente tipada
 - Concorrente
 - Suporte a closures
 - Dependencias explicitas
 - Funções com multiplos retornos
 - Ponteiros

### Uso

Uma linguagem focada em concorrencia. Se fossemos resumir Go em duas palavras seriam: simplicidade e performance. A razão desta linguagem ser criada é que os autores queriam uma linguagem que fosse fácil de programar e com alta capacidade de performance.
O Go tenta combinar a facilidade de uma linguagem de programação interpretada e dinamicamente tipada com a eficiência e segurança de uma linguagem de programação estaticamente tipada.


### Expressividade

#### i. Concorrência

Go traz uma maior simplicidade na implementação, economia de memória (com o uso de Goroutines) e compartilhamento de dados, com segurança, entre Goroutines, durante a execução.

<pre><code>
package main

import (
	"flag"
	"fmt"
	"time"
)

func measure(start time.Time, name string) {
	elapsed := time.Since(start)
	fmt.Printf("%s took %s", name, elapsed)
	fmt.Println()
}

var maxCount = flag.Int("n", 1000000, "how many")

func f(output, input chan int) {
	output <- 1 + <-input
}

func test() {
	fmt.Printf("Started, sending %d messages.", *maxCount)
	fmt.Println()
	flag.Parse()
	defer measure(time.Now(), fmt.Sprintf("Sending %d messages", *maxCount))
	finalOutput := make(chan int)
	var left, right chan int = nil, finalOutput
	for i := 0; i < *maxCount; i++ {
		left, right = right, make(chan int)
		go f(left, right)
	}
	right <- 0
	x := <-finalOutput
	fmt.Println(x)
}

func main() {
	test()
	test()
}


Concorrência GoLang</pre></code>

<pre><code>
using System;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Threading.Tasks.Channels;

namespace ChannelsTest
{
    class Program
    {
        public static void Measure(string title, Action<int, bool> test, int count, int warmupCount = 1)
        {
            test(warmupCount, true); // Warmup
            var sw = new Stopwatch();
            GC.Collect();
            sw.Start();
            test(count, false);
            sw.Stop();
            Console.WriteLine($"{title}: {sw.Elapsed.TotalMilliseconds:0.000}ms");
        }

        static async void AddOne(WritableChannel<int> output, ReadableChannel<int> input)
        {
            await output.WriteAsync(1 + await input.ReadAsync());
        }

        static async Task<int> AddOne(Task<int> input)
        {
            var result = 1 + await input;
            await Task.Yield();
            return result;
        }

        static void Main(string[] args)
        {
            if (!int.TryParse(args.FirstOrDefault(), out var maxCount))
                maxCount = 1000000;
            Measure($"Sending {maxCount} messages (channels)", (count, isWarmup) => {
                var firstChannel = Channel.CreateUnbuffered<int>();
                var output = firstChannel;
                for (var i = 0; i < count; i++) {
                    var input = Channel.CreateUnbuffered<int>();
                    AddOne(output.Out, input.In);
                    output = input;
                }
                output.Out.WriteAsync(0);
                if (!isWarmup)
                    Console.WriteLine(firstChannel.In.ReadAsync().Result);
            }, maxCount);
            Measure($"Sending {maxCount} messages (Task<int>)", (count, isWarmup) => {
                var tcs = new TaskCompletionSource<int>();
                var firstTask = AddOne(tcs.Task);
                var output = firstTask;
                for (var i = 0; i < count; i++) {
                    var input = AddOne(output);
                    output = input;
                }
                tcs.SetResult(-1);
                if (!isWarmup)
                    Console.WriteLine(output.Result);
            }, maxCount);
        }
    }
}

Concorrência C#</code></pre>

##### Retorno

<code><pre>
###### C#

1000000
Sending 1000000 messages (channels): 3545.006ms
1000000
Sending 1000000 messages (Task<int>): 1693.675ms
</code></pre>

<code><pre>
###### Go

Started, sending 1000000 messages.
1000000
Sending 1000000 messages took 3.5034779s
Started, sending 1000000 messages.
1000000
Sending 1000000 messages took 808.9572ms
</code></pre>

Go traz uma maior simplicidade na implementação, na economia de memória (com o uso de Goroutines) e no compartilhamento de dados entre Goroutines durante a execução, de forma prática e segura. 
A primeira execução deste teste leva quase exatamente o mesmo tempo em Go e em C#. Já o segundo teste de Go leva basicamente 4.3x. A versão de C# baseada em tarefas é 2.05x mais rápida, mesmo assim ainda é 2x mais lento que a execução em Go.
A performance de Go é tão melhor na segunda execução, pelo fato de Go não precisar realocar uma pilha, pois as pilhas são reutilizadas.
Go utiliza Canais como forma de compartilhar dados entre suas Goroutines, esses canais consistem em Queues sincronizadas em memória que podem ser utilizados por Goroutines e Expressões Regulares, com objetivo de se comunicarem entre si.

##### Canais

Canais possuem, por padrão um estado bloqueante. Isso significa que se enviarmos um valor a um Canal, ele será bloqueado até que o canal seja recebido, assim como será bloqueado quando o Canal for recebido, até que alguém envie um novo valor para o Canal.

<code><pre>
import (
    "fmt"
    "time"
)
 
func main() {
    ch := make(chan int)
 
    // Inicia uma Goroutine que le o valor de um canal e escreve
    go func(ch chan int) {
        fmt.Println("start")
        fmt.Println(<-ch)
    }(ch)
 
    // Inicia uma Goroutine que escreve um - por segundo
    go func() {
        for i := 0; i < 5; i++ {
            time.Sleep(time.Second)
            fmt.Println("-")
        }
    }()
 
    time.Sleep(2500 * time.Millisecond)
 
    // Enviando um valor para o Canal
    ch <- 5
 
    time.Sleep(3 * time.Second)
}

</pre></code>


Esse comportamento liga fortemete remetente e recebedor, isso pode ser um comportamento indesejado, algumas vezes. A linguagem do Google apresenta algumas alternativas.

##### Buffered Channels

Esses "Buffered Channels" são canais que permitem guardar um certo numero de valores que o remetente não bloqueia, até que o Canal esteja cheio.

<code><pre>
import (
    "fmt"
    "time"
)
 
 
func main() {
    ch := make(chan int, 3)
 
    // Start a goroutine that reads a value from the channel every second and prints it
    go func(ch chan int) {
        for {
            time.Sleep(time.Second)
            fmt.Printf("Goroutine received: %d\n", <-ch)
        }
 
    }(ch)
 
    // Start a goroutine that prints a dash every second
    go func() {
        for i := 0; i < 5; i++ {
            time.Sleep(time.Second)
            fmt.Println("-")
        }
    }()
 
    // Push values to the channel as fast as possible
    for i := 0; i < 5; i++ {
        ch <- i
        fmt.Printf("main() pushed: %d\n", i)
    }
 
    // Sleep five more seconds to let all goroutines finish
    time.Sleep(5 * time.Second)
}
</code></pre>

Após alimentar os 3 valores, a função principal libera um valor e preenche um novo, até preencher todos os valores.

##### Select

Select é uma alternativa ao uso de Buffer, pois a não ser que possua memória suficiente, o uso de Buffer pode não resolver totalmente a necessidade do programa. O uso de Select permite que o programa continue mesmo que todos os Canais estejam bloqueados pelas Goroutines. 	
<code><pre>
func main() {
    r := rand.New(rand.NewSource(time.Now().UnixNano()))
 
    sum := func(a int, b int) <-chan int {
        ch := make(chan int)
        go func() {
            // Random time up to one second
            delay := time.Duration(r.Int()%1000) * time.Millisecond
            time.Sleep(delay)
            ch <- a + b
            close(ch)
        }()
        return ch
    }
 
    // Call sum 4 times with the same parameters
    ch1 := sum(3, 5)
    ch2 := sum(3, 5)
    ch3 := sum(3, 5)
    ch4 := sum(3, 5)
 
    // wait for the first goroutine to write to its channel
    select {
    case result := <-ch1:
        fmt.Printf("ch1: 3 + 5 = %d", result)
    case result := <-ch2:
        fmt.Printf("ch2: 3 + 5 = %d", result)
    case result := <-ch3:
        fmt.Printf("ch3: 3 + 5 = %d", result)
    case result := <-ch4:
        fmt.Printf("ch4: 3 + 5 = %d", result)
    }
}
</pre></code>
