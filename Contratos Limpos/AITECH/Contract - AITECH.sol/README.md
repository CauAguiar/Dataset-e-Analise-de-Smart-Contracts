# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `AITECH`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
|----------|-----------------------------------------|---------------|

---

### Análise por LLM

#### GPT-4o
| ID  | Descrição                                              | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|--------------------------------------------------------|----------------------|----------|----------------|
| -   | Centralized Token Minting                             | High severity       | ❌       | FP             |
| -   | Potential Reentrancy Risks                            | High severity       | ❌       | FP             |
| -   | Lack of Access Control on Minting                     | Medium severity     | ❌       | FP             |
| -   | Decimals Function Usage                               | Low severity        | ❌       | FP             |
| -   | Lack of Events for Token Transfers                    | Informational       | ❌       | FP             |
| -   | Lack of Explicit Visibility on Mint Function          | Informational       | ❌       | FP             |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID  | Descrição                                                      | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                     |
|-----|----------------------------------------------------------------|--------------------------|----------|-------------------------------------|
| -   | Regulatory Compliance                                           | Undetermined              | ❌       | FP                                  |
| -   | Initial Supply Minting                                          | Informational             | ❌       | FP                                  |
| -   | Burnable Tokens                                                 | Informational             | ❌       | FP                                  |
| -   | OpenZeppelin Dependencies                                       | Informational             | ❌       | FP                                  |
| -   | Name/Symbol Consistency                                         | Informational             | ❌       | FP                                  |
| -   | Fixed Supply                                                    | Informational             | ❌       | FP                                  |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


#### Llama 3.3
| ID  | Descrição                                       | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|-----------------------------------------------|----------------------|----------|----------------|
| -   | Reentrancy                                   | High severity       | ❌       | FP             |
| -   | Privilege Escalation                         | High severity       | ❌       | FP             |
| -   | Lack of Input Validation                     | Medium severity     | ❌       | FP             |
| -   | Use of Obsolete Functions                    | Medium severity     | ❌       | FP             |
| -   | Lack of Event Emission                       | Low severity        | ❌       | FP             |
| -   | Inefficient Use of Gas                       | Low severity        | ❌       | FP             |
| -   | Lack of Upgradeability                       | Undetermined        | ❌       | FP             |
| -   | Unprotected Function                         | Undetermined        | ❌       | FP             |
| -   | Outdated Solidity Version                    | Informational       | ❌       | FP             |
| -   | Missing Contract Metadata                    | Informational       | ❌       | FP             |
| -   | Use of Unaudited Libraries                   | Informational       | ❌       | FP             |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 11 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                       | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|-----------------------------------------------|----------------------|----------|----------------|
| -   | Distribuição Inicial de Fornecimento Centralizada | Informational       | ❌       | FP             |
| -   | Falta de Mecanismos de Controle de Acesso Específicos | Informational       | ❌       | FP             |
| -   | Fornecimento Total Fixo na Implantação       | Informational       | ❌       | FP             |
| -   | Privilégios Limitados do Proprietário (Implantador) | Informational       | ❌       | FP             |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

## Métricas Agregadas (AITECH.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 21.43 |
| **DeepSeek-R1** | 33.56 |
| **Llama 3.3** | 5.16 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 8.62 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 6 | 0 | 0 |
| **DeepSeek-R1** | 0 | 6 | 0 | 0 |
| **Llama 3.3** | 0 | 11 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

---
