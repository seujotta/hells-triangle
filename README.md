## Resolução do problema Hells Triangle

Para resolver o problema, criei um script ruby, sem utilizar nenhum framework, apenas o rspec para criar os testes da aplicação.

O Algoritimo que resolve o desafio é o seguinte:

```ruby
def maximum_total
  summed_up = @triangle.first.first
  prev_index = 0
  @triangle[1..-1].each do |item|
    nearest_indexes = item.each_index.select{ |i| i >= prev_index and i <= (prev_index+1) }
    nearest_values = item.values_at(nearest_indexes[0], nearest_indexes[1])
    max_index = nearest_values.index(nearest_values.max)
    summed_up = summed_up + nearest_values[max_index]
    prev_index = nearest_indexes[max_index]
  end
  summed_up
end
```

Para que ter mais liberdade ao trabalhar, com indices de arrays, criei uma camada de validação para garantir que ao chegar no metodo `maximum_total` não corra o risco de cair em algum null pointer.

A primeira coisa que fiz foi pegar o primeiro, elemento do array de entrada, e pegar o valor e atribuir para uma variável que acumulara o total de cada linha e como o primeiro elemento é um array de uma posição, considero que última posição utilizada foi a posição 0.

```ruby
summed_up = @triangle.first.first
prev_index = 0
```

A seguir iterei o array de entrada, começando a partir da posição 1 até o final dos elementos:

```ruby
@triangle[1..-1].each do |item|
 ...
end
```

Para cada elemento dentro desse array de entrada faço o seguinte:

Pego os índices, dos elementos vizinhos, com base no index da linha anterior.
```ruby
nearest_indexes = item.each_index.select{ |i| i >= prev_index and i <= (prev_index+1) }
```

Depois de obter os índices, pegos os valores, de cada um dos índices.

```ruby
nearest_values = item.values_at(nearest_indexes[0], nearest_indexes[1])
```

Pego o índice do maior valor entre os vizinhos, com esse índice pego o maior valor entre os vizinhos, incremento variável de total, e atualizo o index usado, para a próxima rodada.

```ruby
max_index = nearest_values.index(nearest_values.max)
summed_up = summed_up + nearest_values[max_index]
prev_index = nearest_indexes[max_index]
```

## Testando a solução:

Clone esse projeto:

```git
git clone https://github.com/seujotta/hells-triangle.git
```

Renomeie o arquivo `use.rb.sample` para `use.rb` depois rode:

```ruby
bundle install
```

e rode

```ruby
`ruby use.rb`
```
