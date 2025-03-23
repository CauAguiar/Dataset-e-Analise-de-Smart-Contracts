# Smart Contract Audit Analysis with LLMs

## Auditoria: `ERC20Vault`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                                                                           | Severidade            |
|-----|-----------------------------------------------------------------------------------------------------|-----------------------|
| V01 | Unchecked transfer causes user to lose funds allocated for fee                                      | High severity       |
| V02 | Users would permanently lose their funds if message failed due to incorrect decoding of message.data | High severity         |
| V03 | Unable to recall the bridged tokens                                                                  | High severity         |
| V04 | Use encodeCall instead of encodeWithSelector                                                         | Low severity          |
| V05 | Check __gaps have configure same size in all contracts                                               | Informational findings|

---
#### GPT-4o
| ID  | Descrição                                                                                            | Severidade Detectada | Correta? | Tipo (VP/FP/FN)           |
| --- | ---------------------------------------------------------------------------------------------------- | -------------------- | -------- | ------------------------- |
| V01 | Unchecked transfer causes user to lose funds allocated for fee                                       | -      | ❌        | FN                        |
| V02 | Users would permanently lose their funds if message failed due to incorrect decoding of message.data | -       | ❌        | FN                        |
| V03 | Unable to recall the bridged tokens                                                                  | Medium severity      | ✅        | VP (severidade incorreta) |
| V04 | Use encodeCall instead of encodeWithSelector                                                         | -                    | ❌        | FN                        |
| V05 | Check \_\_gaps have configure same size in all contracts                                             | -                    | ❌        | FN                        |
| -   | Problema de Reentrada em `receiveToken`                                                              | High severity        | ❌        | FP                        |
| -   | Manipulação de Endereço na Migração de Tokens                                                        | High severity        | ❌        | FP                        |
| -   | Falta de Validação de Token na \_handleMessage                                                       | Medium severity      | ❌        | FP                        |
| -   | Risco de Bloqueio de Fundos em `onMessageRecalled`                                                   | Medium severity      | ❌        | FP                        |
| -   | Confiança Excessiva em `addressManager` e `resolve`                                                  | Medium severity      | ❌        | FP                        |
| -   | Uso de `transferFrom` Sem Checagem de Sucesso                                                        | Low severity         | ❌        | FP                        |
| -   | Possível Problema na Cálculo de `_balanceChange`                                                     | Low severity         | ❌        | FP                        |
| -   | Eventos Após Transferência de Fundos                                                                 | Low severity         | ❌        | FP                        |
| -   | Dependência de `IBridgedERC20` sem Código Visível                                                    | Undetermined         | ❌        | FP                        |
| -   | Impacto da Função `resolve`                                                                          | Undetermined         | ❌        | FP                        |
| -   | Uso de `__gap` sem Explicação                                                                        | Informational        | ❌        | FP                        |
| -   | Comentários e Documentação Incompletos                                                               | Informational        | ❌        | FP                        |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 12 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V03                | Medium            | High                   | **1**    |  

### DeepSeek-R1
| ID  | Descrição                                                                                           | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|------|-----------------------------------------------------------------------------------------------------|--------------------------|----------|--------------------------|
| V01  | Unchecked transfer causes user to lose funds allocated for fee                                      | High severity            |   ✅     | VP                         |
| V02  | Users would permanently lose their funds if message failed due to incorrect decoding of message.data | -                        | ❌       | FN                         |
| V03  | Unable to recall the bridged tokens                                                                  | -                        | ❌       | FN                         |
| V04  | Use encodeCall instead of encodeWithSelector                                                         | -                        | ❌       | FN                         |
| V05  | Check __gaps have configure same size in all contracts                                               | Informational            | ✅       | VP                         |
| -    | Bridged Token Access Control                                                                        | High severity            | ❌       | FP                         |
| -    | Chain ID Truncation Risk                                                                            | High severity            | ❌       | FP                         |
| -    | Token Metadata Volatility                                                                           | Medium severity          | ❌       | FP                         |
| -    | Front-Runnable Token Deployment                                                                     | Medium severity          | ❌       | FP                         |
| -    | Insecure Message Recall Handling                                                                     | Medium severity          | ❌       | FP                         |
| -    | Bridged Token Blacklist Bypass                                                                      | Low severity             | ❌       | FP                         |
| -    | Symbol/Name Collision                                                                                | Low severity             | ❌       | FP                         |
| -    | BridgedERC20 Implementation Risks                                                                   | Undetermined             | ❌       | FP                         |
| -    | Reentrancy Protections                                                                              | Informational            | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 9 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

---

### llhama 3.3
| ID  | Descrição                                                                                           | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|------|-----------------------------------------------------------------------------------------------------|--------------------------|----------|--------------------------|
| V01  | Unchecked transfer causes user to lose funds allocated for fee                                      | -                        | ❌       | FN                         |
| V02  | Users would permanently lose their funds if message failed due to incorrect decoding of message.data | -                        | ❌       | FN                         |
| V03  | Unable to recall the bridged tokens                                                                  | -                        | ❌       | FN                         |
| V04  | Use encodeCall instead of encodeWithSelector                                                         | -                        | ❌       | FN                         |
| V05  | Check __gaps have configure same size in all contracts                                               | Informational            | ❌       | FN                         |
| -    | Reentrância                                                                                        | High severity            | ❌       | FP                         |
| -    | Perda de fundos                                                                                    | High severity            | ❌       | FP                         |
| -    | Controle de acesso                                                                                 | High severity            | ❌       | FP                         |
| -    | Integralidade de dados                                                                             | Medium severity          | ❌       | FP                         |
| -    | Erros de inicialização                                                                             | Medium severity          | ❌       | FP                         |
| -    | Falhas de validação                                                                                | Medium severity          | ❌       | FP                         |
| -    | Ineficiência de gas                                                                                 | Low severity             | ❌       | FP                         |
| -    | Prefixos de função                                                                                 | Low severity             | ❌       | FP                         |
| -    | Comentários                                                                                        | Low severity             | ❌       | FP                         |
| -    | Interoperabilidade                                                                                 | Undetermined             | ❌       | FP                         |
| -    | Segurança da rede                                                                                  | Undetermined             | ❌       | FP                         |
| -    | Boas práticas de coding                                                                            | Informational            | ❌       | FP                         |
| -    | Documentação                                                                                       | Informational            | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 13 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

---

### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                                                                           | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|------|-----------------------------------------------------------------------------------------------------|--------------------------|----------|--------------------------|
| V01  | Unchecked transfer causes user to lose funds allocated for fee                                      | -                        | ❌       | FN                         |
| V02  | Users would permanently lose their funds if message failed due to incorrect decoding of message.data | Medium severity          | ✅       | VP (severidade incorreta) |
| V03  | Unable to recall the bridged tokens                                                                  | -                        | ❌       | FN                         |
| V04  | Use encodeCall instead of encodeWithSelector                                                         | -                        | ❌       | FN                         |
| V05  | Check __gaps have configure same size in all contracts                                               | -                        | ❌       | FN                         |
| -    | Potencial Inconsistência de Propriedade do Bridged Token no `changeBridgedToken`                    | Medium severity          | ❌       | FP                         |
| -    | Risco de Reentrância no Receptor de Ether em `sendToken`                                            | Low severity             | ❌       | FP                         |
| -    | Risco de Reentrância no Receptor de Ether em `receiveToken`                                         | Low severity             | ❌       | FP                         |
| -    | Falta de Validação Rigorosa dos Dados `CanonicalERC20` em `receiveToken`                            | Medium severity          | ❌       | FP                         |
| -    | Risco de Reentrância no Receptor de Ether em `onMessageRecalled`                                    | Low severity             | ❌       | FP                         |
| -    | Dependência da Aprovação Prévia de `transferFrom` para Canonical Tokens                             | Informational            | ❌       | FP                         |
| -    | Potencial Risco na Inicialização do Proxy `BridgedERC20`                                            | Medium severity          | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 7 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V02               | Medium            | High                   | **1**    |  





## Métricas Agregadas (ERC20Vault.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 20.32 |
| **DeepSeek-R1** | 49.75 |
| **Llama 3.3** | 23.77 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 22.19 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 12 | 4 | 0 |
| **DeepSeek-R1** | 2 | 9 | 3 | 0 |
| **Llama 3.3** | 0 | 13 | 5 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 1 | 7 | 4 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 1 | 1 | 1.00 |
| **DeepSeek-R1** | 0 | 2 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 1 | 1 | 1.00 |

