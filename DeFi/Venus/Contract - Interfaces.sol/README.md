# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Interfaces`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID   | Descrição                                                                          | Severidade       |
|------|----------------------------------------------------------------------------------|------------------|
| VEN-3 | Uso de versão vulnerável do Solidity                                           | Low              |

#### GPT-4o
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | -        | ❌          | FN                         |
| -    | External Calls to Untrusted Contracts         | High severity       | ❌       | FP                         |
| -    | Possível Reentrada (Reentrancy)               | High severity       | ❌       | FP                         |
| -    | Falta de Validação de Entrada                 | Medium severity     | ❌       | FP                         |
| -    | Dependência de Endereços Externos             | Medium severity     | ❌       | FP                         |
| -    | Risco de Front-Running                        | Low severity        | ❌       | FP                         |
| -    | Ausência de Eventos para Auditoria           | Low severity        | ❌       | FP                         |
| -    | Uso de Enum Pode Levar a Erros               | Informational       | ❌       | FP                         |
| -    | Possível Falta de Suporte para Atualizações Seguras | Informational  | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 8 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | -       | ❌        | FN                         |
| -    | Incorrect Collateral Token Handling            | High severity       | ❌       | FP                         |
| -    | Insufficient Access Controls                   | High severity       | ❌       | FP                         |
| -    | Reentrância em chamadas externas               | High severity       | ❌       | FP                         |
| -    | Native Token Handling Flaws                    | High severity       | ❌       | FP                         |
| -    | Unvalidated Function Parameters                | Medium severity     | ❌       | FP                         |
| -    | External Contract Dependency Risks             | Medium severity     | ❌       | FP                         |
| -    | Upgradeable Contract Risks                     | Medium severity     | ❌       | FP                         |
| -    | Paused Action Bypass                           | Medium severity     | ❌       | FP                         |
| -    | Return Value Ignorance                         | Low severity        | ❌       | FP                         |
| -    | Incorrect Liquidation Incentives               | Low severity        | ❌       | FP                         |
| -    | Market Status Assumptions                      | Low severity        | ❌       | FP                         |
| -    | Protocol Reserve Manipulation                  | Undetermined        | ❌       | FP                         |
| -    | VAI Repay Amount Accuracy                      | Undetermined        | ❌       | FP                         |
| -    | Interface-Only Code                            | Informational      | ❌       | FP                         |
| -    | ERC20 Approval Risks                           | Informational      | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 15 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

---

#### Llama 3.3
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | Low severity        | ✅       | VP                         |
| -    | Reentrância                                    | High severity       | ❌       | FP                         |
| -    | Uniswap V2 Pair Front Running                 | High severity       | ❌       | FP                         |
| -    | Liquidity Pool Draining                        | High severity       | ❌       | FP                         |
| -    | Unprotected Function                          | Medium severity     | ❌       | FP                         |
| -    | Use of Transfer                               | Medium severity     | ❌       | FP                         |
| -    | Reentrancy in Liquidation                     | Medium severity     | ❌       | FP                         |
| -    | Missing Input Validation                      | Low severity        | ❌       | FP                         |
| -    | Complexidade do Código                        | Undetermined        | ❌       | FP                         |
| -    | Interoperabilidade                            | Undetermined        | ❌       | FP                         |
| -    | Lack of Comments                              | Informational      | ❌       | FP                         |
| -    | Code Organization                            | Informational      | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 11 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | -        | ❌          | FN                    |
| -    | Reentrância em `liquidateBorrow` e `liquidateVAI` | High severity       | ❌       | FP                         |
| -    | Cálculos Incorretos em Lógica de Liquidação    | High severity       | ❌       | FP                         |
| -    | Controle de Acesso Insuficiente em `IProtocolShareReserve.updateAssetsState` | Medium severity | ❌ | FP                         |
| -    | Potencial DoS via `IComptroller.actionPaused` | Medium severity     | ❌       | FP                         |
| -    | Suscetibilidade a Front-Running em Liquidações | Low severity        | ❌       | FP                         |
| -    | Risco de Dependência de Contratos Externos    | Informational      | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |





## Métricas Agregadas (Interfaces.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 12.22 |
| **DeepSeek-R1** | 40.42 |
| **Llama 3.3** | 8.41 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 13.13 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 8 | 1 | 0 |
| **DeepSeek-R1** | 0 | 15 | 1 | 0 |
| **Llama 3.3** | 1 | 11 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 6 | 1 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 1 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

