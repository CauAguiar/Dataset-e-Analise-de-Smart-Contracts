# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `IBlacklist`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
|----------|-----------------------------------------|---------------|

---

### Análise por LLM

#### GPT-4o
| ID  | Descrição                                       | Severidade Detectada          | Correta? | Tipo (VP/FP/FN)                     |
|-----|-------------------------------------------------|-------------------------------|----------|-------------------------------------|
| -   | Centralization Risk                            | High severity                 | ❌       | FP                                  |
| -   | Lack of Access Control Implementation          | High severity                 | ❌       | FP                                  |
| -   | Irrevocable Burning                            | High severity                 | ❌       | FP                                  |
| -   | Event Emission Mismatch                        | Medium severity               | ❌       | FP                                  |
| -   | Absence of Validation                          | Medium severity               | ❌       | FP                                  |
| -   | Lack of Documentation for Role Management      | Low severity                  | ❌       | FP                                  |
| -   | No Implementation Details                      | Informational severity        | ❌       | FP                                  |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID  | Descrição                                           | Severidade Detectada          | Correta? | Tipo (VP/FP/FN)                     |
|-----|-----------------------------------------------------|-------------------------------|----------|-------------------------------------|
| -   | Centralized Control Risk                            | High severity                 | ❌       | FP                                  |
| -   | Missing Access Control Separation                  | High severity                 | ❌       | FP                                  |
| -   | Unvalidated Burn Targets                           | High severity                 | ❌       | FP                                  |
| -   | Inconsistent Event Logging                          | Medium severity               | ❌       | FP                                  |
| -   | Incomplete Role Management Definition              | Low severity                  | ❌       | FP                                  |
| -   | Lack of Safeguards Against Abuse                   | Undetermined                  | ❌       | FP                                  |
| -   | Documentation-Implementation Mismatch              | Informational severity        | ❌       | FP                                  |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Llama 3.3
| ID  | Descrição                                           | Severidade Detectada          | Correta? | Tipo (VP/FP/FN)                     |
|-----|-----------------------------------------------------|-------------------------------|----------|-------------------------------------|
| -   | Controle Centralizado                               | High severity                 | ❌       | FP                                  |
| -   | Permissão Excessiva                                 | High severity                 | ❌       | FP                                  |
| -   | Falta de Validação                                  | High severity                 | ❌       | FP                                  |
| -   | Dependência de Papéis                               | Medium severity               | ❌       | FP                                  |
| -   | Falta de Transparência                              | Medium severity               | ❌       | FP                                  |
| -   | Custo de Gas                                        | Medium severity               | ❌       | FP                                  |
| -   | Potencial para Spam                                 | Low severity                  | ❌       | FP                                  |
| -   | Impacto Regulatório                                 | Undetermined                  | ❌       | FP                                  |
| -   | Auditoria e Testes                                  | Informational severity        | ❌       | FP                                  |
| -   | Documentação                                        | Informational severity        | ❌       | FP                                  |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                             | Severidade Detectada         | Correta? | Tipo (VP/FP/FN)                     |
|-----|-------------------------------------------------------|------------------------------|----------|-------------------------------------|
| -   | Falta de Clareza no Gerenciamento de `COMPLIANCE_ROLE` | Medium severity               | ❌       | FP                                  |
| -   | Granularidade Limitada na Funcionalidade de Blacklist e Burn | Low severity                 | ❌       | FP                                  |
| -   | Risco de Uso Indevido da Funcionalidade por Detentores do Role `COMPLIANCE_ROLE` | High severity                | ❌       | FP                                  |
| -   | Potencial para Griefing Através do Mecanismo de Blacklist | Medium severity               | ❌       | FP                                  |
| -   | Ausência de Mecanismo de Reversão ou Recuperação de Emergência para 'Burn' | Medium severity               | ❌       | FP                                  |
| -   | Dependência Implícita de Contrato de Token Externo para 'Burn' | Undetermined                 | ❌       | FP                                  |
| -   | Falta de Validação de Entrada Detalhada para o Parâmetro `account` | Low severity                 | ❌       | FP                                  |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


## Métricas Agregadas (IBlacklist.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 24.04 |
| **DeepSeek-R1** | 32.75 |
| **Llama 3.3** | 7.32 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 9.49 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 7 | 0 | 0 |
| **DeepSeek-R1** | 0 | 7 | 0 | 0 |
| **Llama 3.3** | 0 | 10 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 7 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

