# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Zenqira`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID    | Descrição                                              | Severidade             |
|-------|--------------------------------------------------------|------------------------|
| - | -                           | -                  |

---

#### GPT-4o
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|--------------|--------------------------|--------------------------|----------|--------------------------|
| -            | Centralização da emissão | High severity            | ❌       | FP                       |
| -            | Possível falta de controle de mintagem adicional | Medium severity | ❌       | FP                       |
| -            | Uso de `decimals()` herdado sem verificação | Low severity        | ❌       | FP                       |
| -            | Falta de eventos de monitoramento | Informational severity | ❌       | FP                       |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|--------------|--------------------------|--------------------------|----------|--------------------------|
| -            | Mismatch de versão do OpenZeppelin | Medium severity       | ❌       | FP                       |
| -            | Falta de Mecanismo de Upgradeabilidade | Low severity       | ❌       | FP                       |
| -            | Potenciais riscos de dependência | Undetermined risk    | ❌       | FP                       |
| -            | Grande fornecimento inicial de tokens | Informational     | ❌       | FP                       |
| -            | Metadados de Token fixos | Informational            | ❌       | FP                       |
| -            | Decimais padrão do ERC20 | Informational            | ❌       | FP                       |
| -            | Flexibilidade de versão do compilador | Informational     | ❌       | FP                       |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Llama 3.3
| ID   | Descrição                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)           |
|------|--------------------------|--------------------------|----------|---------------------------|
| -    | Permissão excessiva       | High                     | ❌       | FP                        |
| -    | Riscos de minting         | High                     | ❌       | FP                        |
| -    | Falta de restrições de transferência | Medium           | ❌       | FP                        |
| -    | Uso de versão de Solidity muito antiga | Medium         | ❌       | FP                        |
| -    | Falta de comentários e documentação | Low            | ❌       | FP                        |
| -    | Uso de bibliotecas de terceiros sem auditoria | Low      | ❌       | FP                        |
| -    | Potencial de uso indevido | Undetermined             | ❌       | FP                        |
| -    | Informações de licenciamento e compatibilidade | Informational | ❌  | FP                        |
| -    | Detalhes de implementação (ERC20 OpenZeppelin) | Informational | ❌  | FP                        |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID | Descrição                             | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|--------------|---------------------------------------|--------------------------|----------|------------------------------|
| -            | Centralização da Distribuição Inicial de Tokens | Medium severity          | ❌       | FP                           |
| -            | Fornecimento Fixo de Tokens          | Informational severity   | ❌       | FP                           |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 2 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |


## Métricas Agregadas (Zenqira.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 10.07 |
| **DeepSeek-R1** | 33.52 |
| **Llama 3.3** | 8.97 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 9.94 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 4 | 0 | 0 |
| **DeepSeek-R1** | 0 | 7 | 0 | 0 |
| **Llama 3.3** | 0 | 9 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 2 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

---

