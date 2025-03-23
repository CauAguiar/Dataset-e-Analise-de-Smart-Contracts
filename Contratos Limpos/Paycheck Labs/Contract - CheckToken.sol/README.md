# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `CheckToken`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID    | Descrição                                              | Severidade             |
|-------|--------------------------------------------------------|------------------------|
| - | -                           | -                  |


### Análise por LLM

#### GPT-4o
| ID  | Descrição                                               | Severidade Detectada    | Correta? | Tipo (VP/FP/FN)            |
|-----|---------------------------------------------------------|-------------------------|----------|---------------------------|
| -   | Centralized Token Minting                               | High                    | ❌       | FN                        |
| -   | Falta de Mecanismo de Governança                        | High                    | ❌       | FN                        |
| -   | Possível Problema de Precisão (MAX_SUPPLY)              | Medium                  | ❌       | FN                        |
| -   | Uso de Versão de Solidity Não Estável (`0.8.26`)        | Low                     | ❌       | FN                        |
| -   | Contrato Não Implementa Mecanismos de Taxação ou Recompensas | Informational            | ❌       | FN                        |
| -   | Nome e Símbolo do Token Estão Hardcoded                | Informational            | ❌       | FN                        |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
**Tabela LLM:**
| ID   | Descrição                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|------|--------------------------|--------------------------|----------|------------------|
| -    | Centralização do Fornecimento Inicial | Informational           | ❌       | FP               |
| -    | Dependência de Bibliotecas Externas | Informational           | ❌       | FP               |
| -    | Falta de Gestão Explícita de Propriedade | Informational           | ❌       | FP               |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 3 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Llama 3.3
Aqui está a comparação das vulnerabilidades da Auditoria Oficial com o arquivo Experimental, conforme o template fornecido:

**Tabela LLM Comparada:**
| ID  | Descrição                         | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|-----|-----------------------------------|--------------------------|----------|------------------------------|
| -   | Permissão excessiva              | High severity            | ❌       | FP                           |
| - | Ataques de reentrância           | High severity            | ❌       | FP    |
|- | Uso de bibliotecas não atualizadas| Medium severity          | ❌       | FP    |
| -   | Falta de validação de dados      | Medium severity          | ❌       | FP                           |
| -   | Falta de documentação            | Low severity             | ❌       | FP                           |
| -   | Nomenclatura de variáveis        | Low severity             | ❌       | FP                           |
| -   | Limitações de segurança da rede  | Undetermined severity    | ❌       | FP                           |
| -   | Uso de licenças                  | Informational severity   | ❌       | FP                           |
| -   | Compatibilidade com padrões      | Informational severity   | ❌       | FP                           |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
**Tabela LLM corrigida:**
| ID   | Descrição                                                        | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)         |
|------|------------------------------------------------------------------|--------------------------|----------|-------------------------|
| -    | Centralização Inicial de Fornecimento                            | High severity            | ❌       | FP                      |
| -    | Funcionalidade de Queima de Tokens Expõe Método Público 'burn'  | Informational            | ❌       | FP                      |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 2 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |


## Métricas Agregadas (CheckToken.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 6.12 |
| **DeepSeek-R1** | 38.17 |
| **Llama 3.3** | 14.94 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 8.94 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 6 | 0 | 0 |
| **DeepSeek-R1** | 0 | 3 | 0 | 0 |
| **Llama 3.3** | 0 | 9 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 2 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

