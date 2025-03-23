# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `RFRM`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
|----------|-----------------------------------------|---------------|

---

### Análise por LLM

#### GPT-4o
| ID  | Descrição | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
| --- | --------- | -------------------- | -------- | --------------- |
| -   | Nenhum mecanismo de governança ou controle de mintagem adicional | High severity | ❌ | FP |
| -   | Possível centralização de tokens na conta do deployer | Medium severity | ❌ | FP |
| -   | Uso de Solidity 0.8.23 em vez de uma versão fixa | Low severity | ❌ | FP |
| -   | Falta de eventos para rastreamento de ações importantes | Informational | ❌ | FP |
| -   | Ausência de comentários sobre possíveis atualizações do contrato | Informational | ❌ | FP |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 5 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID  | Descrição                                    | Severidade Detectada        | Correta? | Tipo (VP/FP/FN) |
| --- | -------------------------------------------- | --------------------------- | -------- | --------------- |
| -   | Centralização de Controle                    | Low severity                | ❌       | FP              |
| -   | Possível Dependência de Versão do Compilador | Undetermined                 | ❌       | FP              |
| -   | Falta de Eventos Personalizados             | Informational               | ❌       | FP              |
| -   | Documentação de Decimal Limitado            | Informational               | ❌       | FP              |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


#### Llama 3.3
| ID  | Descrição                                        | Severidade Detectada        | Correta? | Tipo (VP/FP/FN) |
| --- | ------------------------------------------------ | --------------------------- | -------- | --------------- |
| -   | Vulnerabilidade de Controle de Acesso           | High severity               | ❌       | FP              |
| -   | Vulnerabilidade de Reentrância                  | High severity               | ❌       | FP              |
| -   | Vulnerabilidade de DoS                          | Medium severity             | ❌       | FP              |
| -   | Vulnerabilidade de Manipulação de Eventos       | Medium severity             | ❌       | FP              |
| -   | Vulnerabilidade de Informação Sensível          | Low severity                | ❌       | FP              |
| -   | Vulnerabilidade de Ineficiência de Gás          | Low severity                | ❌       | FP              |
| -   | Vulnerabilidade de Interoperabilidade           | Undetermined                | ❌       | FP              |
| -   | Falta de Documentação                           | Informational               | ❌       | FP              |
| -   | Uso de Bibliotecas Desatualizadas              | Informational               | ❌       | FP              |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID | Descrição                                                        | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|----|------------------------------------------------------------------|----------------------|----------|-----------------|
| -  | Centralização da Emissão de Tokens                               | Informational        | ❌       | FP              |
| -  | Falta de Mecanismos de Governança ou Controle de Acesso Adicional | Informational        | ❌       | FP              |
| -  | Dependência de Bibliotecas Externas (OpenZeppelin)               | Informational        | ❌       | FP              |
| -  | Ausência de Validação de Entrada ou Limites Específicos           | Informational        | ❌       | FP              |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


## Métricas Agregadas (RFRM.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 9.03 |
| **DeepSeek-R1** | 22.26 |
| **Llama 3.3** | 7.72 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 11.26 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 5 | 0 | 0 |
| **DeepSeek-R1** | 0 | 4 | 0 | 0 |
| **Llama 3.3** | 0 | 9 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

