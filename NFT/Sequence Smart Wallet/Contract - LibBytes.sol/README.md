# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `LibBytes`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID      | Descrição                                                                | Severidade         |
|---------|--------------------------------------------------------------------------|--------------------|
| QSP-1   | Unhandled Overflows in LibBytes.sol on lines 146 and 185                | Informational      |

---

### Análise por LLM

#### GPT-4o
| ID      | Descrição                                                                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|--------------------------------------------------------------------------|--------------------------|----------|------------------------|
| QSP-1   | Unhandled Overflows in LibBytes.sol on lines 146 and 185                | -                        | ❌       | FN                     |
| -       | Acesso a Memória Não Segura                                            | High                     | ❌       | FP                      |
| -       | Falta de Verificação de Índice Antes do Acesso à Memória               | Medium                   | ❌       | FP                      |
| -       | Manipulação Ineficiente de Arrays em `readBytes`                        | Medium                   | ❌       | FP                     |
| -       | Uso de `shr` sem `and` em `readFirstUint16`                             | Low                      | ❌       | FP                     |
| -       | Comentários Desatualizados ou Imprecisos                                | Informational            | ❌       | FP                     |
| -       | Uso de `assembly` sem Necessidade Justificada                          | Informational            | ❌       | FP                      |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação

#### Deepseek-R1
| ID    | Descrição                                                            | Severidade Detectada    | Correta? | Tipo (VP/FP/FN)           |
|-------|----------------------------------------------------------------|----------------------|----------|----------------------|
| QSP-1 | Unhandled Overflows in LibBytes.sol on lines 146 and 185      | -       | ❌       | FN                   |
| -     | Verificação Tardia de Limites                               | High Severity       | ❌       | FP                   |
| -     | Corrupção de Memória em `readBytes66`                        | High Severity       | ❌       | FP                   |
| -     | Sobrescrita de Memória em `readBytes`                          | High Severity       | ❌       | FP                   |
| -     | Uso Inseguro de `assembly` para Manipulação de Bytes         | Medium Severity     | ❌       | FP                   |
| -     | Leitura de Dados Não Inicializados                           | Medium Severity     | ❌       | FP                   |
| -     | Desalinhamento de Bytes em Operações de Shift                 | Low Severity        | ❌       | FP                   |
| -     | Uso Excessivo de `assembly`                                    | Informational       | ❌       | FP                   |
| -     | Falta de Documentação Detalhada                              | Informational       | ❌       | FP                   |
| -     | Compatibilidade de Versão do Solidity                          | Undetermined        | ❌       | FP                   |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação

#### Llama 3.3
| ID      | Descrição                                                             | Severidade Detectada | Correta? | Tipo (VP/FP/FN)             |
|---------|------------------------------------------------------------------------|----------------------|----------|-----------------------------|
| QSP-1   | Unhandled Overflows in LibBytes.sol on lines 146 and 185               | High                 | ✅       | VP (severidade incorreta)   |
| -       | Reentrância na função `readBytes`                                     | High                 | ❌       | FP                          |
| -       | Out of Bounds em múltiplas funções                                    | Medium               | ❌       | FP                          |
| -       | Injeção de dados na função `readBytes`                                | Medium               | ❌       | FP                          |
| -       | Ineficiência na função `readBytes`                                    | Low                  | ❌       | FP                          |
| -       | Uso excessivo de memória na função `readBytes`                        | Low                  | ❌       | FP                          |
| -       | Comportamento indefinido quando `size == 0` na função `readBytes`     | Undetermined         | ❌       | FP                          |
| -       | Erro de tipos na função `readBytes32`                                 | Undetermined         | ❌       | FP                          |
| -       | Código comentado insuficientemente                                    | Informational        | ❌       | FP                          |
| -       | Falta de documentação adequada                                        | Informational        | ❌       | FP                          |
| -       | Ausência de testes adequados                                          | Informational        | ❌       | FP                          |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 10 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| QSP-1                | High             | Informational                  | **3**    |   

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID    | Descrição                                                                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|-------|------------------------------------------------------------------|--------------------------|----------|----------------|
| QSP-1 | Unhandled Overflows in LibBytes.sol on lines 146 and 185        | High           | ✅        | VP (severidade incorreta)            |
| -     | Leitura Fora dos Limites em Funções de Leitura (Padrão Comum) | High                    | ❌        | FP             |
| -     | Verificação de Limites Apos Leitura em `readBytes32`          | Medium                  | ❌        | FP             |
| -     | Uso de Assembly para Operações Simples                         | Informational           | ❌        | FP             |
| -     | Mensagens de Erro Genéricas                                     | Informational           | ❌        | FP             |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 4 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| QSP-1                | High             | Informational                  | **3**    |


## Métricas Agregadas (LibBytes.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 9.10 |
| **DeepSeek-R1** | 161.77 |
| **Llama 3.3** | 17.17 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 12.06 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 6 | 1 | 0 |
| **DeepSeek-R1** | 0 | 9 | 1 | 0 |
| **Llama 3.3** | 1 | 10 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 1 | 4 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 3 | 1 | 3.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 3 | 1 | 3.00 |

