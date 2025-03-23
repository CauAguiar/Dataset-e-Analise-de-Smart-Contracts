# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `AcceleratingDistributor`

### Vulnerabilidades Conhecidas (Ground Truth)

| ID  | Descrição | Severidade |
|-----|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| V01 | **Atualização de configuração impacta retroativamente as recompensas dos usuários** - A função `configureStakingToken` no contrato `AcceleratingDistributor` pode alterar imediatamente as recompensas dos usuários que já possuem tokens em staking. Modificar os parâmetros `maxMultiplier` ou `secondsToMaxMultiplier` afeta diretamente os valores de recompensas pendentes, levando a aumentos ou reduções inesperadas para os usuários. Não há um mecanismo para evitar esse impacto retroativo. | Medium severity |
| V02 | **Valores máximos perigosos para cálculos de recompensa** - Os limites superiores definidos para `maxMultiplier` e `baseEmissionRate` são muito superiores aos valores esperados, permitindo uma emissão excessiva de tokens caso sejam configurados erroneamente. Isso pode levar a uma rápida exaustão do pool de recompensas antes que o erro seja detectado e corrigido. | Low severity |
| V03 | **Falta de validação de entrada** - Algumas funções do contrato `AcceleratingDistributor` não validam corretamente os parâmetros de entrada. Por exemplo, a função `stakeFor` não impede que o endereço do beneficiário seja o zero address, e as funções `unstake` e `_stake` não verificam se o valor de entrada é maior que zero. | Low severity |
| V04 | **Docstrings ausentes ou incompletas** - Diversas funções e structs no contrato `AcceleratingDistributor` não possuem documentação adequada, dificultando a revisão e manutenção do código. | Low severity |
| V05 | **Possível erro de underflow** - A função `getUserRewardMultiplier` pode falhar devido a um erro de underflow se `maxMultiplier` for definido abaixo de `1e18`, impedindo os usuários de realizar staking, reivindicar recompensas ou retirar seus tokens. | Low severity |
| V06 | **Parâmetro de evento sempre será zero** - O evento `RewardsWithdrawn`, emitido pela função `withdrawReward`, sempre terá o parâmetro `userRewardsOutstanding` como zero, tornando-o redundante. | Informational findings |
| V07 | **Documentação enganosa** - Comentários no código contêm informações imprecisas ou conflitantes com a documentação oficial, o que pode gerar confusão entre desenvolvedores e revisores. | Informational findings |
| V08 | **Ordenação inconsistente no código** - A estrutura do código do contrato `AcceleratingDistributor` não segue consistentemente o guia de estilo recomendado para Solidity, dificultando a legibilidade e manutenção. | Informational findings |
| V09 | **Erros tipográficos** - Diversos erros gramaticais e tipográficos foram identificados no código-fonte, o que pode impactar a clareza da documentação e dos comentários. | Informational findings |


#### GPT-4o

| ID  | Descrição | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|--------------------------------------------|----------------------|----------|----------------|
| V01 | Atualização de configuração impacta retroativamente as recompensas dos usuários | - | ❌ | FN |
| V02 | Valores máximos perigosos para cálculos de recompensa | - | ❌ | FN | 
| V03 | Falta de validação de entrada | - | ❌ | FN |
| V04 | Docstrings ausentes ou incompletas | - | ❌ | FN |
| V05 | Possível erro de underflow | Medium severity | ✅ | VP | (severidade incorreta)
| V06 | Parâmetro de evento sempre será zero | - | ❌ | FN |
| V07 | Documentação enganosa | - | ❌ | FN |
| V08 | Ordenação inconsistente no código | - | ❌ | FN |
| V09 | Erros tipográficos | - | ❌ | FN |
| -   | Possível Ataque de Reentrância | High severity | ❌ | FP |
| -   | Falta de Restrição na Transferência de `rewardToken` | High severity | ❌ | FP |
| -   | Possível Bloqueio de Fundos no `recoverToken` | High severity | ❌ | FP |
| -   | Falta de Validação de `msg.sender` em `exit` | Medium severity | ❌ | FP |
| -   | Possível Manipulação do Multiplicador de Recompensas | Medium severity | ❌ | FP |
| -   | Uso de `block.timestamp` para Cálculo de Recompensas | Low severity | ❌ | FP | -
| -   | Falta de Restrição em `stakeFor` | Low severity | ❌ | FP |
| -   | Falta de Eventos para Algumas Operações Críticas | Informational findings | ❌ | FP |
| -   | Possível Ineficiência no `recoverToken` | Informational findings | ❌ | FP |
| -   | Compatibilidade com Tokens ERC20 Não Padrão | Undetermined | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 10 (FP)                |
| **Não Detectado** | 8 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V05               | Medium              | Low                   | **1**    |  
___________________________________________________________________________________________________________________________________________________________________

#### DeepSeek-R1

| ID   | Descrição                                               | Severidade Detectada    | Correta? | Tipo (VP/FP/FN)             |
|------|---------------------------------------------------------|-------------------------|----------|-----------------------------|
| V01  | Atualização de configuração impacta retroativamente as recompensas dos usuários | - | ❌ | FN |
| V02  | Valores máximos perigosos para cálculos de recompensa | - | ❌ | FN |
| V03  | Falta de validação de entrada                          | - | ❌ | FN |
| V04  | Docstrings ausentes ou incompletas                     | - | ❌ | FN |
| V05  | Possível erro de underflow                             | Medium severity | ✅ | VP (severidade incorreta) |
| V06  | Parâmetro de evento sempre será zero                   | - | ❌ | FN |
| V07  | Documentação enganosa                                  | - | ❌ | FN |
| V08  | Ordenação inconsistente no código                      | - | ❌ | FN |
| V09  | Erros tipográficos                                     | -              | ❌ | FN |
| -    | Incompatibilidade com Tokens que Cobram Taxas de Transferência | High severity | ❌ | FP | 
| -    | Manipulação de `averageDepositTime`                    | Medium severity | ❌ | FP |
| -    | Dependência de `block.timestamp`                       | Low severity | ❌ | FP |
| -    | Alterações Arbitrárias de Parâmetros pelo Owner        | Low severity | ❌ | FP |
| -    | Falta de Verificação de Tokens não ERC20 Compatíveis   | Informational findings | ❌ | FP |
| -    | Documentação Insuficiente sobre Mecanismos de Recompensa | Informational findings | ❌ | FP |
| -    | Erros de Precisão em Cálculos Aritméticos              | Undetermined | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 7 (FP)                 |
| **Não Detectado** | 8 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença           |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V05              | Medium            | Low                   | **1**    |  
___________________________________________________________________________________________________________________________________________________________________


#### Llama 3.3

**Tabela LLM:**
| ID  | Descrição                                      | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|-----|------------------------------------------------|----------------------|----------|--------------------------|
| V01 | Atualização de configuração impacta retroativamente as recompensas dos usuários | - | ❌ | FN |
| V02 | Valores máximos perigosos para cálculos de recompensa | - | ❌ | FN |
| V03 | Falta de validação de entrada | - | ❌ | FN |
| V04 | Docstrings ausentes ou incompletas | - | ❌ | FN |
| V05 | Possível erro de underflow | - | ❌ | FN |
| V06 | Parâmetro de evento sempre será zero | - | ❌ | FN |
| V07 | Documentação enganosa | - | ❌ | FN |
| V08 | Ordenação inconsistente no código | - | ❌ | FN |
| V09 | Erros tipográficos | - | ❌ | FN |
| -   | Reentrância | High severity | ❌ | FP |
| -   | Transferência de tokens não segura | High severity | ❌ | FP |
| -   | Manipulação de timestamp | Medium severity | ❌ | FP |
| -   | Overflows | Medium severity | ❌ | FP |
| -   | Front-running | Medium severity | ❌ | FP |
| -   | Informações de depósito duplicadas | Low severity | ❌ | FP |
| -   | Lógica de recompensa complexa | Undetermined | ❌ | FP |
| -   | Interoperabilidade com outros contratos | Undetermined | ❌ | FP |
| -   | Comentários e documentação | Informational findings | ❌ | FP |
| -   | Utilização de bibliotecas seguras | Informational findings | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                |
| **Não Detectado** | 9 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação


#### Gemini 2.0 Flash Thinking Experimental 01-21


| ID  | Descrição                                                                 | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|---------------------------------------------------------------------------|----------------------|----------|----------------|
| V01 | Atualização de configuração impacta retroativamente as recompensas       | -                   | ❌        | FN            |
| V02 | Valores máximos perigosos para cálculos de recompensa                    | Low severity        | ✅       | VP             |
| V03 | Falta de validação de entrada                                            | Low severity        | ✅       | VP             |
| V04 | Docstrings ausentes ou incompletas                                       | -                   | ❌       | FN             |
| V05 | Possível erro de underflow                                               | -                   | ❌       | FN             |
| V06 | Parâmetro de evento sempre será zero                                     | -                   | ❌       | FN             |
| V07 | Documentação enganosa                                                    | -                   | ❌       | FN             |
| V08 | Ordenação inconsistente no código                                        | -                   | ❌       | FN             |
| V09 | Erros tipográficos                                                       | -                   | ❌       | FN             |
| -   | Potencial Denegação de Serviço (DoS) por Limite de Gás nos Blocos        | High severity       | ❌       | FP             | 
| -   | Possíveis Problemas de Precisão nos Cálculos de Recompensa               | Low severity        | ❌       | FP             | 
| -   | Front-Running em `configureStakingToken`                                 | Medium severity     | ❌       | FP             |
| -   | Falta de Limites de Reconfiguração                                       | Informational       | ❌       | FP             |
| -   | Potencial Griefing/DoS em `recoverToken`                                 | Low severity        | ❌       | FP             |
| -   | Dependência do Timestamp do Bloco                                        | Informational       | ❌       | FP             |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 6 (FP)                 |
| **Não Detectado** | 7 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação
___________________________________________________________________________________________________________________________________________________________________




## Métricas Agregadas (AcceleratingDistributor.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 11.23 |
| **DeepSeek-R1** | 45.89 |
| **Llama 3.3** | 19.94 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 4.77 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 10 | 8 | 0 |
| **DeepSeek-R1** | 1 | 7 | 8 | 0 |
| **Llama 3.3** | 0 | 10 | 9 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 2 | 6 | 7 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 1 | 1 | 1.00 |
| **DeepSeek-R1** | 1 | 1 | 1.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 2 | 0.00 |

