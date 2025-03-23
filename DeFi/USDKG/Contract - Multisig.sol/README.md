# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Multisig`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                                                  | Severidade         |
|-----|----------------------------------------------------------------------------|--------------------|
| V01 | Inaccurate Comments and Messages                                           | Minor              |
| V02 | Call to Transfer Native Token Refund                                       | Minor              |
| V03 | Settle Solidity Version for Deployed Contracts                             | Minor              |
| V04 | Inconsistent Transaction Execution Logic in Multisig Contract Deviates From Gnosis Safe and Documentation | Minor              |
| V05 | Unused Variable and Functions                                               | Minor              |
___________________________________________________________________________________________________________________________________________________________________
#### GPT-4o

| ID  | Descrição                                                                 | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|---------------------------------------------------------------------------|----------------------|----------|----------------|
| V01 | Inaccurate Comments and Messages                                          | Informational      | ✅       | VP (severidade incorreta) |
| V02 | Call to Transfer Native Token Refund                                      | -       |   ❌     | FN |
| V03 | Settle Solidity Version for Deployed Contracts                            | -       | ❌       | FN |
| V04 | Inconsistent Transaction Execution Logic in Multisig Contract Deviates From Gnosis Safe and Documentation |-| ❌ | FN |
| V05 | Unused Variable and Functions                                             |-      | ❌       | FN |
| -   | Falta de verificação de contrato para tokens ERC-20                       | High               | ❌       | FP |
| -   | Uso de `tx.origin` na função `handlePayment`                              | High               | ❌       | FP |
| -   | Possível DoS ao iterar sobre proprietários na função `checkNApprovals`    | Medium             | ❌       | FP |
| -   | Falta de eventos para algumas ações críticas                              | Medium             | ❌       | FP |
| -   | Armazenamento de `owners` em um mapeamento ligado a uma estrutura encadeada | Low                | ❌       | FP |
| -   | Uso de constantes para hashes de EIP-712 sem considerar futuras mudanças  | Low                | ❌       | FP |
| -   | Uso de assembly para a função `transferToken` sem tratamento de falhas adequado | Informational | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 7 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V01                | Informational              | Low                  | **1**    |  
___________________________________________________________________________________________________________________________________________________________________
### DeepSeek-R1

| ID  | Descrição                                                                 | Severidade Detectada   | Correta? | Tipo (VP/FP/FN)                       |
|-----|---------------------------------------------------------------------------|------------------------|----------|---------------------------------------|
| V01 | Inaccurate Comments and Messages                                          | -          | ❌       | FN                                    |
| V02 | Call to Transfer Native Token Refund                                      | -         | ❌       | FN                                    |
| V03 | Settle Solidity Version for Deployed Contracts                            | -          | ❌       | FN                                    |
| V04 | Inconsistent Transaction Execution Logic in Multisig Contract Deviates From Gnosis Safe and Documentation | - | ❌ | FN                   |      
| V05 | Unused Variable and Functions                                             | Não detectado          | ❌       | FN                                    |
| -   | Arbitrary Delegatecall via simulateAndRevert                              | High                   | ❌       | FP                                    |
| -   | Lack of EIP-1271 Support                                                  | High                   | ❌       | FP                                    |
| -   | Gas Limit in Owner Loop                                                   | Medium                 | ❌       | FP                                    |
| -   | Insufficient Gas Price Handling                                           | Medium                 | ❌       | FP                                    |
| -   | ERC20 Token Handling Flaws                                                | Low                    | ❌       | FP                                    |
| -   | Unused Data Parameter                                                     | Informational          | ❌       | FP                                    |
| -   | SignatureSplit Bounds Checks                                              | Undetermined           | ❌       | FP                                    |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
___________________________________________________________________________________________________________________________________________________________________

### Llama 3.3

| ID   | Descrição                                                                 | Severidade Detectada         | Correta? | Tipo (VP/FP/FN)                           |
|------|---------------------------------------------------------------------------|------------------------------|----------|-------------------------------------
| V01  | Inaccurate Comments and Messages                                         | -                            | ❌       | FN                                   
| V02  | Call to Transfer Native Token Refund                                      | -                            | ❌       | FN                                  
| V03  | Settle Solidity Version for Deployed Contracts                            | -                            | ❌       | FN                                  
| V04  | Inconsistent Transaction Execution Logic in Multisig Contract Deviates From Gnosis Safe and Documentation| ❌       | FN  
| V05  | Unused Variable and Functions                                            | -                            | ❌       | FN                                   
| -    | Reentrancy                                                               | Low severity                 | ❌       | FP           
| -    | Remote Code Execution                                                    | High severity                | ❌       | FP 
| -    | Delegatecall                                                             | High severity                | ❌       | FP          
| -    | Unprotected Function                                                     | Medium severity              | ❌       | FP            
| -    | Reutilização de Hashes                                                   | Medium severity              | ❌       | FP           
| -    | Chamadas Externas Inseguras                                              | Medium severity              | ❌       | FP           
| -    | Função transferToken Insegura                                            | Low severity                 | ❌       | FP           
| -    | Uso de tx.origin                                                         | Low severity                 | ❌       | FP            
| -    | Comportamento de Novo Contrato                                           | Undetermined                 | ❌        |FP                                
| -    | Função getChainId                                                        | Informational                | ❌        |FP                                   
| -    | Função domainSeparator                                                   | Informational                | ❌         |FP                                    

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 11 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação

### Gemini 2.0 Flash Thinking Experimental

| ID  | Descrição                                                                 | Severidade Detectada   | Correta? | Tipo (VP/FP/FN)                       |
|-----|---------------------------------------------------------------------------|------------------------|----------|---------------------------------------|
| V01 | Inaccurate Comments and Messages                                          | -          | ❌       | FN                                    |
| V02 | Call to Transfer Native Token Refund                                      | -          | ❌       | FN                                    |
| V03 | Settle Solidity Version for Deployed Contracts                            | -          | ❌       | FN                                    |
| V04 | Inconsistent Transaction Execution Logic in Multisig Contract Deviates From Gnosis Safe and Documentation | - | ❌ | FN                                    
| V05 | Unused Variable and Functions                                             | -          | ❌       | FN                                    |
| -   | Ausência de Mecanismo de Modificação de Proprietários e Limiar            | Medium                 | ❌       | FP                                    |
| -   | Uso de `tx.origin` para Receptor de Reembolso                             | Medium                 | ❌       | FP                                    |
| -   | Inexistência de Revogação ou Expiração de Hash Aprovado                   | Medium                 | ❌       | FP                                    |
| -   | Potencial Reentrância em Chamadas Externas                                | Medium                 | ❌       | FP                                    |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
____________________________________________________________________________________________________________________________________________________________

## Métricas Agregadas (Multisig.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 10.28 |
| **DeepSeek-R1** | 124.16 |
| **Llama 3.3** | 19.61 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 12.09 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 7 | 4 | 0 |
| **DeepSeek-R1** | 0 | 7 | 5 | 0 |
| **Llama 3.3** | 0 | 11 | 5 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 5 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 1 | 1 | 1.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

