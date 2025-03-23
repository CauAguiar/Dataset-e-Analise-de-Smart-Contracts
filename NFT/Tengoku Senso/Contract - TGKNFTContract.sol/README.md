# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `TGKNFTContract`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID      | Descrição                                                               | Severidade         |
|---------|-------------------------------------------------------------------------|--------------------|
| TENGO-1 | Anyone Can Mint an Arbitrary Number of NFTs                              | High severity      |
| TENGO-3 | The Contract TGKNFTContract Does Not Compile                             | High severity      |
| TENGO-4 | Missing Test Suite and Limited Documentation Makes It Hard to Assess that the System Works as Expected | High severity      |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                        | Low severity       |

---

### Análise por LLM

#### GPT-4o
| ID      | Descrição                                                                                      | Severidade Detectada | Correta? | Tipo (VP/FP/FN)             |
|---------|------------------------------------------------------------------------------------------------|----------------------|----------|-----------------------------|
| TENGO-1 | Falta de Controle de Acesso na Função `mintNFT`                                                | High severity       | ✅       | VP                          |
| TENGO-3 | O Contrato TGKNFTContract Não Compila                                                          | -                  | ❌       | FN                          |
| TENGO-4 | Falta de Testes e Documentação Limitada, Dificultando a Avaliação do Sistema                   | -                   | ❌       | FN                          |
| TENGO-6 | Uso Potencial de Versão de Compilador com Bugs Conhecidos                                      | -                   | ❌       | FN                          |
| -       | Possível Reutilização de `_newItemID`                                                          | Medium severity     | ❌       | FP                          |
| -       | Falta de Verificação de Existência do Token na `tokenURI`                                      | Low severity        | ❌       | FP                          |
| -       | Uso de `UNLICENSED` na SPDX                                                                    | Informational       | ❌       | FP                          |
| -       | Eventos Poderiam Registrar Mais Informações                                                    | Informational       | ❌       | FP                          |
| -       | Possível Problema com `_beforeTokenTransfer`                                                   | Undetermined        | ❌       | FP                          |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 5 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação 

#### DeepSeek-R1
| ID      | Descrição                                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|-------------------------------------------------------------------------|--------------------------|----------|--------------------------|
| TENGO-1 | Lack of Access Control in mintNFT                                       | High severity            | ✅       | VP                       |
| TENGO-3 | The Contract TGKNFTContract Does Not Compile                           | -                        | ❌       | FN                       |
| TENGO-4 | Missing Test Suite and Limited Documentation                          | -                        | ❌       | FN                       |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                     | -                        | ❌       | FN                       |
| -       | Missing Token URI Validation                                          | Low severity             | ❌       | FP                       |
| -       | Unlicensed SPDX Identifier                                           | Informational            | ❌       | FP                       |
| -       | Inheritance Override Complexity                                      | Undetermined              | ❌       | FP                       |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 3 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação


#### Llama 3.3
| ID      | Descrição                                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|-------------------------------------------------------------------------|--------------------------|----------|--------------------------|
| TENGO-1 | Unsecured Token Minting                                               | Medium severity          | ✅       | VP (severidade incorreta) |
| TENGO-3 | The Contract TGKNFTContract Does Not Compile                           | -            | ❌       | FN                       |
| TENGO-4 | Missing Test Suite and Limited Documentation                          | Informational           | ✅       | VP (severidade incorreta)  |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                     | -             | ❌       | FN                       |
| -       | Reentrancy                                                           | High severity            | ❌       | FP                       |
| -       | Unprotected Function                                                 | High severity            | ❌       | FP                       |
| -       | Arbitrary Code Execution                                             | High severity            | ❌       | FP                       |
| -       | Lack of Reentrancy Protection                                        | Medium severity          | ❌       | FP                       |
| -       | Use of Outdated Dependencies                                       | Medium severity          | ❌       | FP                       |
| -       | Insufficient Event Emission                                          | Low severity             | ❌       | FP                       |
| -       | Non-Optimal Gas Usage                                                | Low severity             | ❌       | FP                       |
| -       | Potential for Front-Running                                          | Undetermined              | ❌       | FP                       |
| -       | Contract Dependency Risks                                            | Undetermined              | ❌       | FP                       |
| -       | Missing Input Validation                                             | Informational            | ❌       | FP                       |
| -       | Code Style and Best Practices                                        | Informational            | ❌       | FP                       |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 11 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| TENGO-01                | Medium            | High                   | **1**    |  
| TENGO-04               | Informational                | High         | **3**    |  


#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID      | Descrição                                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|-------------------------------------------------------------------------|--------------------------|----------|--------------------------|
| TENGO-1 | Função de Mint Irrestrita                                      | High severity            | ✅       | VP                       |
| TENGO-3 | The Contract TGKNFTContract Does Not Compile                           | -            | ❌       | FN                       |
| TENGO-4 | Missing Test Suite and Limited Documentation                          | -            | ❌       | FN                       |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                     | -             | ❌       | FN                       |
| -       | Alocação de ID de Token Arbitrário                          | Medium severity          | ❌       | FP                       |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 1 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação 


## Métricas Agregadas (TGKNFTContract.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 6.31 |
| **DeepSeek-R1** | 75.98 |
| **Llama 3.3** | 6.09 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 8.22 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 5 | 3 | 0 |
| **DeepSeek-R1** | 1 | 3 | 3 | 0 |
| **Llama 3.3** | 2 | 11 | 2 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 1 | 1 | 3 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 1 | 0.00 |
| **DeepSeek-R1** | 0 | 1 | 0.00 |
| **Llama 3.3** | 4 | 2 | 2.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 1 | 0.00 |

