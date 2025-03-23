# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Elders`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição | Severidade |
|-----|--------------------------|-------------------------|
| V01 | NFT metadata is exposed before minting | High severity |
| V02 | Excess ether is not returned to users | Medium severity |
| V03 | PublicMint is not following the Check-Effects-Interaction pattern | Low severity |

---
#### GPT-4o

| ID  | Descrição                        | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)              
|-----|----------------------------------|--------------------------|----------|-------------------------------- |
| V01 | NFT metadata is exposed before minting | Low severity           | ✅       | VP (severidade incorreta)  |
| V02 | Excess ether is not returned to users |  -        | ❌       | FN                          |
| V03 | PublicMint is not following the Check-Effects-Interaction pattern | - | ❌       | FN        |
| -   | Reentrada em `onERC721Received`    | High severity           | ❌       | FP                            |
| -   | Falta de Verificação Completa em `transferFrom` | High severity    | ❌       | FP                      |
| -   | Mintagem Ilimitada com `_mintERC2309` | High severity          | ❌       | FP                          |
| -   | Falta de Controle de Overflow no Armazenamento de Dados | Medium severity | ❌       | FP               |
| -   | Aprovação Global de Operadores (`setApprovalForAll`) | Medium severity | ❌       | FP                  |
| -   | Falta de Restrição para Endereço Zero | Low severity           | ❌       | FP                          |
| -   | Falta de Eventos em Algumas Operações Sensíveis | Low severity | ❌       | FP                          |
| -   | Comentários e Documentação Incompletos | Informational         | ❌       | FP                          |
| -   | Possível Manipulação de ExtraData | Undetermined            | ❌       | FP                             |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 9 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V01                | Low              | High                   | **2**    |  
____________________________________________________________________________________________________________________________________________________________________

### DeepSeek-R1

| ID  | Descrição                        | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)              |
|-----|----------------------------------|--------------------------|----------|-----------------------------|
| V01 | NFT metadata is exposed before minting | Low severity           | ✅       | VP (severidade incorreta)   |
| V02 | Excess ether is not returned to users | Medium severity        | ❌       | FN                          |
| V03 | PublicMint is not following the Check-Effects-Interaction pattern | Low severity | ✅        | VP                        |
| -   | Incorrect Enforcement of Wallet Mint Limits | High severity       | ❌       | FP                          |
| -   | Unsafe Minting in Mass Airdrop   | Medium severity         | ❌       | FP                          |
| -   | Missing Event Emissions          | Informational           | ❌       | FP                          |
| -   | Centralized Control              | Informational           | ❌       | FP                          |
| -   | Minting Limits Design Clarity    | Undetermined            | ❌       | FP                          |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 5 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V01                | Low              | High                   | **2**    |  
____________________________________________________________________________________________________________________________________________________________________

### Llama 3.3

| ID  | Descrição                     | Severidade Detectada      | Correta? | Tipo (VP/FP/FN)                       |
|-----|-------------------------------|---------------------------|----------|---------------------------------------|
| V01 | NFT metadata is exposed before minting | -            | ❌           | FN                                    |
| V02 | Excess ether is not returned to users  | -            | ❌           | FN                                    |
| V03 | PublicMint is not following the Check-Effects-Interaction pattern | -       | ❌       | FN                  |
| -   | Reentrancy                    | High severity             | ❌       | FP                                    |
| -   | Unprotected Function          | High severity             | ❌       | FP                                    |
| -   | Unsecured Use of Transfer     | High severity             | ❌       | FP                                    |
| -   | Use of Tx.origin              | Medium severity           | ❌       | FP                                    |
| -   | Missing Input Validation      | Medium severity           | ❌       | FP                                    |
| -   | Insecure Use of Assembly      | Medium severity           | ❌       | FP                                    |
| -   | Outdated Solidity Version     | Low severity              | ❌       | FP                                    |
| -   | Unused Variables              | Low severity              | ❌       | FP                                    |
| -   | Code Organization             | Low severity              | ❌       | FP                                    |
| -   | OperatorFilterer              | Undetermined              | ❌       | FP                                    |
| -   | IOperatorFilterRegistry       | Undetermined              | ❌       | FP                                    |
| -   | Contract Size                 | Informational             | ❌       | FP                                    |
| -   | Code Complexity               | Informational             | ❌       | FP                                    |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 13 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação

### Gemini 2.0 Flash Thinking Experimental

| ID  | Descrição                        | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)              |
|-----|----------------------------------|--------------------------|----------|-----------------------------|
| V01 | NFT metadata is exposed before minting | -                    | ❌       | FN                        |
| V02 | Excess ether is not returned to users | -                    | ❌       | FN                        |
| V03 | PublicMint is not following the Check-Effects-Interaction pattern | - | ❌       | FN                        |
| -   | Consumo de Gás Descontrolado no Airdrop em Massa (Potencial DoS) | Medium severity |      ❌    | FP                          |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 1 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
___________________________________________________________________________________________________________________________________________________________________

## Métricas Agregadas (Elders.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 11.64 |
| **DeepSeek-R1** | 129.40 |
| **Llama 3.3** | 17.09 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 22.19 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 9 | 2 | 0 |
| **DeepSeek-R1** | 2 | 5 | 1 | 0 |
| **Llama 3.3** | 0 | 13 | 3 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 1 | 3 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 2 | 1 | 2.00 |
| **DeepSeek-R1** | 2 | 2 | 1.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

