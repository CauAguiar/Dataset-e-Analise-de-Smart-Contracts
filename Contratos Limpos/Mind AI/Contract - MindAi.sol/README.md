# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `MindAi`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID    | Descrição                                              | Severidade             |
|-------|--------------------------------------------------------|------------------------|
| - | -                           | -                  |


### Análise por LLM

#### GPT-4o
| ID  | Descrição                                          | Severidade Detectada      | Correta? | Tipo (VP/FP/FN)              |  
|-----|--------------------------------------------------|--------------------------|----------|------------------------------|  
| -   | Centralized Minting Authority                  | High                     | ❌       | FP                           |  
| -   | Imutabilidade do Supply Inicial                | Medium                   | ❌       | FP                           |  
| -   | Dependência de OpenZeppelin sem Modificações   | Low                      | ❌       | FP                           |  
| -   | Ausência de Função de Recuperação de Tokens Perdidos | Informational       | ❌       | FP                           |  
| -   | Falta de Documentação Sobre Governança        | Informational            | ❌       | FP                           |  

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 5 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID | Descrição                                      | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|----|----------------------------------------------|----------------------|----------|-----------------|
| -  | Centralized Control of Initial Supply      | High severity       | ❌       | FP              |
| -  | Fixed Initial Supply Allocation           | Informational       | ❌       | FP              |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 2 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Llama 3.3
| ID | Descrição                                         | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)              |
|----|-------------------------------------------------|----------------------|----------|------------------------------|
| -  | Bolsa de mint sem restrição de autorização      | High                 | ❌       | FP                           |
| -  | Exposição de contrato a ataques de reentrância  | High                 | ❌       | FP                           |
| -  | Uso de versão específica do Solidity           | Medium               | ❌       | FP                           |
| -  | Hardcode de endereços                          | Medium               | ❌       | FP                           |
| -  | Falta de eventos de mintagem                   | Low                  | ❌       | FP                           |
| -  | Comentários insuficientes                      | Low                  | ❌       | FP                           |
| -  | Impacto de futuras atualizações da OpenZeppelin | Undetermined         | ❌       | FP                           |
| -  | Desempenho do contrato em diferentes ambientes  | Undetermined         | ❌       | FP                           |
| -  | Informações de contato de segurança            | Informational        | ❌       | FP                           |
| -  | Licença de software                            | Informational        | ❌       | FP                           |
| -  | Metadados do contrato                          | Informational        | ❌       | FP                           |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 11 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID | Descrição                                      | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|----|-----------------------------------------------|----------------------|----------|----------------|
| -  | Endereço de Mintagem e Quantidade Hardcoded  | High                | ❌       | FN            |
| -  | Distribuição Centralizada de Tokens         | High                | ❌       | FN            |
| -  | Ausência de Controle de Mintagem Pós-Implantação | Informational  | ❌       | FN            |
| -  | Dependência de Biblioteca Externa (OpenZeppelin) | Informational | ❌       | FN            |
| -  | Ausência de Mecanismo de Atualização        | Medium              | ❌       | FN            |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 5 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |


## Métricas Agregadas (MindAi.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 8.76 |
| **DeepSeek-R1** | 27.92 |
| **Llama 3.3** | 17.75 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 9.27 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 5 | 0 | 0 |
| **DeepSeek-R1** | 0 | 2 | 0 | 0 |
| **Llama 3.3** | 0 | 11 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 5 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

