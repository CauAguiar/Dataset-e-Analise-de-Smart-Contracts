# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `BNB`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID    | Descrição                                              | Severidade             |
|-------|--------------------------------------------------------|------------------------|
| BNB-01| Centralization Related Risks                           | Major                  |
| BNB-02| Shadowing Built-In Symbol                              | Minor                  |
| BNB-03| Usage Of transfer() For Sending ETH                    | Minor                  |
| BNB-04| Unused Return Variable                                 | Informational          |
| BNB-05| Redundant Code Components                              | Informational          |
| BNB-06| Deprecated Standards                                    | Informational          |
| BNB-07| Solidity Version Not Recommended                       | Informational          |
| BNB-08| Function And Variable Naming Doesn't Match Environment | Informational          |
| BNB-09| Missing Emit Events                                    | Informational          |

---

### Análise por LLM

#### GPT-4o
| ID       | Descrição                                          | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|----------|--------------------------------------------------|--------------------------|----------|----------------|
| BNB-01   | Centralization Related Risks                     | -                        | ❌       | FN             |
| BNB-02   | Shadowing Built-In Symbol                        | -                        | ❌       | FN             |
| BNB-03   | Usage Of transfer() For Sending ETH              | High                     | ✅       | VP (severidade incorreta) |
| BNB-04   | Unused Return Variable                           | -                        | ❌       | FN             |
| BNB-05   | Redundant Code Components                        | -                        | ❌       | FN             |
| BNB-06   | Deprecated Standards                             | High                     | ✅       | VP (severidade incorreta) |
| BNB-07   | Solidity Version Not Recommended                 | Informational            | ✅       | VP             |
| BNB-08   | Function And Variable Naming Doesn't Match Env.  | -                        | ❌       | FN             |
| BNB-09   | Missing Emit Events                              | Medium                   | ✅       | VP (severidade incorreta) |
| -        | Falta de Modificadores de Acesso                | High                     | ❌       | FP             |
| -        | Problema no Sistema de Aprovação (`approve`)     | Medium                   | ❌       | FP             |
| -        | Falta de uma função `constructor`               | Low                      | ❌       | FP             |
| -        | Uso de `assert` para verificações de entrada     | Low                      | ❌       | FP             |
| -        | Possível problema com a função `freeze`         | Undetermined             | ❌       | FP             |
| -        | Não implementa o padrão ERC-20 completo         | Informational            | ❌       | FP             |

#### Matriz de Confusão:
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 4 (VP)             | 6 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

#### Erro de Classificação:
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|---------------------------|------------------------|-------------------------|  
| BNB-03             | High                      | Minor | **2**    |  
| BNB-06             | High                      | Informational | **3**    |  
| BNB-09             | Medium                    | Informational | **2**    |

---

#### DeepSeek-R1
| ID       | Descrição                                          | Severidade Detectada       | Correta? | Tipo (VP/FP/FN)                   |
|----------|--------------------------------------------------|----------------------------|----------|----------------------------------|
| BNB-01   | Centralization Related Risks                     | Informational              | ✅       | VP (severidade incorreta)      |
| BNB-02   | Shadowing Built-In Symbol                        | -                          | ❌       | FN                               |
| BNB-03   | Usage Of transfer() For Sending ETH              | -                          | ❌       | FN                               |
| BNB-04   | Unused Return Variable                           | -                          | ❌       | FN                               |
| BNB-05   | Redundant Code Components                        | Low                         | ✅       | VP (severidade incorreta)      | 
| BNB-06   | Deprecated Standards                             | High                        | ✅       | VP (severidade incorreta)      | 
| BNB-07   | Solidity Version Not Recommended                 | Medium                      | ✅       | VP (severidade incorreta)      | 
| BNB-08   | Function And Variable Naming Doesn't Match Env.  | -                          | ❌       | FN                               |
| BNB-09   | Missing Emit Events                              | -                          | ❌       | FN                               |
| -        | ERC20 Transfer Function Missing Return Value     | High                        | ❌       | FP                               |
| -        | ERC20 Allowance Race Condition                   | Medium                      | ❌       | FP                               |
| -        | Missing Function Visibility Specifiers           | Low                         | ❌       | FP                               |
| -        | Payable Fallback Function                        | Informational               | ❌       | FP                               |
| -        | Constructor Naming Convention                    | Informational               | ❌       | FP                               |
| -        | Freeze/Unfreeze Mechanism Scope                  | Undetermined                | ❌       | FP                               |

#### Matriz de Confusão:
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 4 (VP)             | 6 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

#### Erro de Classificação
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|---------------------------|------------------------|-------------------------|  
| BNB-01             | Informational             | High                   | **3**    |  
| BNB-05             | Low                        | High                   | **2**    |  
| BNB-06             | Low                        | High                   | **2**    |  
| BNB-07             | Medium                     | High                   | **1**    |  

---

#### Llama 3.3
| ID      | Descrição                                              | Severidade Detectada       | Correta? | Tipo (VP/FP/FN)              |
|---------|--------------------------------------------------------|----------------------------|----------|------------------------------|
| BNB-01  | Centralization Related Risks                           | -                          | ❌       | FN                           |
| BNB-02  | Shadowing Built-In Symbol                              | -                          | ❌       | FN                           |
| BNB-03  | Usage Of transfer() For Sending ETH                    | High                       | ✅       | VP (severidade incorreta)    |
| BNB-04  | Unused Return Variable                                 | -                          | ❌       | FN                           |
| BNB-05  | Redundant Code Components                              | -                          | ❌       | FN                           |
| BNB-06  | Deprecated Standards                                   | Informational              | ✅       | VP                            |
| BNB-07  | Solidity Version Not Recommended                       | Informational              | ✅       | VP                           |
| BNB-08  | Function And Variable Naming Doesn't Match Environment | -                          | ❌       | FN                           |
| BNB-09  | Missing Emit Events                                    | -                          | ❌       | FN                           |
| -       | Reentrancy                                             | High                       | ❌       | FP                           |
| -       | Falta de validação de entrada                         | Medium                     | ❌       | FP                           |
| -       | Uso de `assert`                                        | Medium                     | ❌       | FP                           |
| -       | Falta de controle de acesso                           | Medium                     | ❌       | FP                           |
| -       | Uso de `uint256`                                       | Low                         | ❌       | FP                           |
| -       | Falta de comentários                                  | Low                         | ❌       | FP                           |
| -       | Segurança da função `withdrawEther`                   | Undetermined               | ❌       | FP                           |
| -       | Segurança da função `freeze` e `unfreeze`             | Undetermined               | ❌       | FP                           |

### Matriz de Confusão
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|------------------|------------------------|
| **Detectado** | 3 (VP)           | 8 (FP)                |
| **Não Detectado** | 6 (FN)       | 0 (VN)                |

#### Erro de Classificação
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença |
|--------------------|-------------------------|------------------------|-----------|
| BNB-03            | High                     | Low                      | **2**   |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID    | Descrição                                              | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)                      |
|-------|--------------------------------------------------------|-----------------------|----------|--------------------------------------|
| BNB-01| Centralization Related Risks                           | Major                 | ❌       | FN                                   |
| BNB-02| Shadowing Built-In Symbol                              | Minor                 | ❌       | FN                                   |
| BNB-03| Usage Of transfer() For Sending ETH                    | Low                 | ✅       | VP                                     |
| BNB-04| Unused Return Variable                                 | Informational         | ❌       | FN                                   |
| BNB-05| Redundant Code Components                              | Informational         | ❌       | FN                                   |
| BNB-06| Deprecated Standards                                   | Low                   | ❌       | FN                                   |
| BNB-07| Solidity Version Not Recommended                       | Informational         | ❌       | FN                                   |
| BNB-08| Function And Variable Naming Doesn't Match Environment | Informational         | ❌       | FN                                   |
| BNB-09| Missing Emit Events                                    | Informational         | ✅       | VP                                   |
| -     | Uso de `assert` em SafeMath                            | Low                   | ❌       | FP                                   |
| -     | Falta de Verificação de Endereço Zero no Construtor    | Informational         | ❌       | FP                                   |

#### Matriz de Confusão:
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 2 (FP)                 |
| **Não Detectado** | 7 (FN)         | 0 (VN)                 |

---


## Métricas Agregadas (BNB.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 11.43 |
| **DeepSeek-R1** | 175.20 |
| **Llama 3.3** | 12.55 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 16.32 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 4 | 6 | 5 | 0 |
| **DeepSeek-R1** | 4 | 6 | 5 | 0 |
| **Llama 3.3** | 3 | 8 | 6 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 2 | 2 | 7 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 7 | 4 | 1.75 |
| **DeepSeek-R1** | 8 | 4 | 2.00 |
| **Llama 3.3** | 2 | 3 | 0.67 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 2 | 0.00 |

