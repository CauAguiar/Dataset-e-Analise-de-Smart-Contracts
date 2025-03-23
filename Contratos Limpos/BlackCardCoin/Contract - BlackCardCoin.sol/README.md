# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `BlackCardCoin`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
|----------|-----------------------------------------|---------------|

---

### Análise por LLM

#### GPT-4o
### **Tabela LLM:**

| ID  | Descrição                                                     | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|---------------------------------------------------------------|----------------------|----------|----------------|
| -   | Missing Constructor Supply Assignment                        | High                | ❌       | FP             |
| -   | Lack of Access Control on Token Minting                      | High                | ❌       | FP             |
| -   | Hardcoded Owner Address                                       | Medium              | ❌       | FP             |
| -   | Insecure `transferFrom` Implementation                        | Medium              | ❌       | FP             |
| -   | Lack of Events for Balance Changes in Internal `_transfer`    | Low                 | ❌       | FP             |
| -   | Use of `require` for Errors Without Custom Error Messages     | Low                 | ❌       | FP             |
| -   | Missing `increaseAllowance` and `decreaseAllowance` Functions | Informational       | ❌       | FP             |
| -   | No `Ownable` or Role-Based Access Control                     | Informational       | ❌       | FP             |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 8 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID  | Descrição                                                     | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|---------------------------------------------------------------|----------------------|----------|----------------|
| -   | Single-Step Ownership Transfer                                | Medium               | ❌       | FP             |
| -   | Hardcoded Reserve Addresses                                   | Low                  | ❌       | FP             |
| -   | Potential Allowance Race Condition                            | Informational        | ❌       | FP             |
| -   | Centralization Risks                                          | Informational        | ❌       | FP             |
| -   | Missing Two-Step Ownership Transfer                           | Informational        | ❌       | FP             |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 5 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


#### Llama 3.3
| ID  | Descrição                                                       | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|-----------------------------------------------------------------|----------------------|----------|-----------------|
| -   | Privilegios de Owner Desprotegidos                               | High                 | ❌       | FP              |
| -   | Reentrancy                                                       | High                 | ❌       | FP              |
| -   | Falta de Restrições em Transferências                            | Medium               | ❌       | FP              |
| -   | Aprovação de Gastos                                             | Medium               | ❌       | FP              |
| -   | Visibility de Funções                                           | Low                  | ❌       | FP              |
| -   | Uso de Constantes Mágicas                                       | Low                  | ❌       | FP              |
| -   | Comportamento em Casos de Borda                                 | Undetermined         | ❌       | FP              |
| -   | Compatibilidade com Outros Contratos                            | Undetermined         | ❌       | FP              |
| -   | Padrões de Codificação                                          | Informational        | ❌       | FP              |
| -   | Documentação                                                    | Informational        | ❌       | FP              |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                                        | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|------------------------------------------------------------------|----------------------|----------|-----------------|
| -   | Centralização de Propriedade                                     | Low                  | ❌       | FP              |
| -   | Endereços Críticos Hardcoded                                     | Low                  | ❌       | FP              |
| -   | Ausência de Mecanismos de Governança ou Atualização              | Informational        | ❌       | FP              |
| -   | Limitações de Controle de Acesso (Além da Propriedade)           | Informational        | ❌       | FP              |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


## Métricas Agregadas (BlackCardCoin.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 28.35 |
| **DeepSeek-R1** | 70.18 |
| **Llama 3.3** | 10.11 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 10.57 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 8 | 0 | 0 |
| **DeepSeek-R1** | 0 | 5 | 0 | 0 |
| **Llama 3.3** | 0 | 10 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

