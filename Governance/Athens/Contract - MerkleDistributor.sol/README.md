# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `MerkleDistributor`

### Vulnerabilidades Conhecidas (Ground Truth)  
| ID  | Descrição                                              | Severidade          |  
|-----|--------------------------------------------------------|---------------------|  
| V01 | Ownership pode ser renunciado                         | Low severity        |  
| V02 | Falta de validação do endereço do token               | Low severity        |  
| V03 | Uso de diferentes versões do Solidity                 | Informational       |  
| V04 | Otimização de gás: uso do novo tipo de dado do 0.8    | Informational       |  


#### GPT-4o

| ID  | Descrição                                      | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                |
|-----|--------------------------------------------------|--------------------------|----------|---------------------------------|
| V01 | Ownership pode ser renunciado                   | -                        | ❌       | FN                              |
| V02 | Falta de validação do endereço do token         | -                        | ❌       | FN                              |
| V03 | Uso de diferentes versões do Solidity           | -                        | ❌       | FN                              |
| V04 | Otimização de gás: uso do novo tipo de dado do 0.8 | -                        | ❌       | FN                              |
| -   | Lack of Access Control                          | High severity            | ❌       | FP                              |
| -   | Reentrancy Risks                                | High severity            | ❌       | FP                              |
| -   | Merkle Proof Manipulation                       | High severity            | ❌       | FP                              |
| -   | Replay Attacks                                  | Medium severity          | ❌       | FP                              |
| -   | DoS via Large Merkle Trees                      | Medium severity          | ❌       | FP                              |
| -   | Lack of Event Emission for Critical Changes    | Low severity             | ❌       | FP                              |
| -   | Gas Inefficiency                               | Low severity             | ❌       | FP                              |
| -   | Token Transfer Assumptions                     | Undetermined             | ❌       | FP                              |
| -   | Lack of Expiration Mechanism                   | Undetermined             | ❌       | FP                              |
| -   | Interface Does Not Enforce Implementation Security | Informational        | ❌       | FP                              |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

#### DeepSeek-R1


| ID  | Descrição                                      | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                |
|-----|--------------------------------------------------|--------------------------|----------|---------------------------------|
| V01 | Ownership pode ser renunciado                   | -                        | ❌       | FN                              |
| V02 | Falta de validação do endereço do token         | -                        | ❌       | FN                              |
| V03 | Uso de diferentes versões do Solidity           | -                        | ❌       | FN                              |
| V04 | Otimização de gás: uso do novo tipo de dado do 0.8 | -                        | ❌       | FN                              |
| -   | Incorrect Order of Operations in `claim` Function | High severity          | ❌       | FP                              |
| -   | Potential Incompatibility with Non-Standard ERC20 Tokens | Undetermined      | ❌       | FP                              |
| -   | Missing Balance Check in `recover` Function     | Informational           | ❌       | FP                              |
| -   | No `msg.sender` Validation in `claim` Function  | Informational           | ❌       | FP                              |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

#### Llama 3.3

| ID  | Descrição                                           | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|-----------------------------------------------------|----------------------|----------|-----------------------------|
| V01 | Ownership pode ser renunciado                      | -     | ❌       | FN                          |
| V02 | Falta de validação do endereço do token            | -    | ❌       | FN                          |
| V03 | Uso de diferentes versões do Solidity              | -     | ❌       | FN                          |
| V04 | Otimização de gás: uso do novo tipo de dado do 0.8 | -    | ❌       | FN                          |
| -   | Reentrância em `claim`                             | High                 | ❌       | FP                          |
| -   | Reentrância em `recover`                           | High                 | ❌       | FP                          |
| -   | Uso de `block.timestamp`                           | Medium               | ❌       | FP                          |
| -   | Falta de validação de `amount`                     | Medium               | ❌       | FP                          |
| -   | Falta de validação de `merkleProof`                | Medium               | ❌       | FP                          |
| -   | Uso de `abi.encodePacked`                          | Low                  | ❌       | FP                          |
| -   | Falta de documentação                              | Low                  | ❌       | FP                          |
| -   | Segurança da árvore de Merkle                      | Undetermined         | ❌       | FP                          |
| -   | Validação de `index`                               | Undetermined         | ❌       | FP                          |
| -   | Uso de contrato herdado                            | Informational        | ❌       | FP                          |
| -   | Uso de bibliotecas externas                        | Informational        | ❌       | FP                          |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 11 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID  | Descrição                                      | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                |
|-----|--------------------------------------------------|--------------------------|----------|---------------------------------|
| V01 | Ownership pode ser renunciado                   | -                        | ❌       | FN                              |
| V02 | Falta de validação do endereço do token         | -                        | ❌       | FN                              |
| V03 | Uso de diferentes versões do Solidity           | -                        | ❌       | FN                              |
| V04 | Otimização de gás: uso do novo tipo de dado do 0.8 | -                        | ❌       | FN                              |
| -   | Potencial de Reentrância durante o Claim       | Medium severity          | ❌       | FP                              |
| -   | Ausência de Limite de Taxa de Claims           | Low severity             | ❌       | FP                              |
| -   | Vulnerabilidade na Geração Off-chain da Merkle Proof | Informational     | ❌       | FP                              |
| -   | Potencial de Recuperação de Valor Zero        | Informational           | ❌       | FP                              |
| -   | Dependência do `lockTime` no Timestamp do Bloco | Informational           | ❌       | FP                              |
| -   | Mensagem de Erro Genérica na Recuperação        | Informational           | ❌       | FP                              |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |


## Métricas Agregadas (MerkleDistributor.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 15.32 |
| **DeepSeek-R1** | 60.62 |
| **Llama 3.3** | 9.16 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 12.45 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 10 | 4 | 0 |
| **DeepSeek-R1** | 0 | 4 | 4 | 0 |
| **Llama 3.3** | 0 | 11 | 4 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 6 | 4 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

