### Tarefa 02

# Go Language

### Origens e Influencias

Criada em 2007 pela equipe do Google. Go Lang tinha como objetivo solucionar problemas que a empresa enfrentava a partir do uso de tecnologias mais robustas como computação massiva, sistemas distribuídos em redes, uso de processadores multinucleos.
Essas tecnologias tornavam a computação muito potente, todavia ela se tornava cada vez mais complexa. Códigos de programas como esses possuem milhares de linhas de código e, em uma empresa do tamanho do Google, milhares de engenheiros desenvolvendo ao mesmo tempo.
Os processos de Merge e Compilação desses programas se tornaram complexos e demorados. Os engenheiros tentaram resolver alguns desses problemas com linguagens já existentes como Java, Python e C++, cada uma com sua característica específica, mas ainda precisavam de uma linguagem que unisse todas elas.

### Classificação e Tipagem

Go é uma linguagem compilada, forte e estaticamente tipada (a amarração das variáveis não pode ser alterada durante a execução).
Orientada a objetos: o Go não possui classes, mas possui tipos. A linguagem utiliza estruturas e métodos que funcionam de forma bem parecida com as classes de outras linguagens, além do uso de Interfaces (uma característica da Orientação a Objetos de Go)

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

#### Concorrência
<pre><code>package main
import "fmt"
func main() {
	go f()
	go g()
}</pre></code>

Maior simplicidade na implementação, economia de memória com o uso de Goroutines e compartilhamento de dados, com segurança,
entre Goroutines durante a execução.
