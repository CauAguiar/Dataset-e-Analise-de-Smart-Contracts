# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `WstETHOracle`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID     | Descrição                                                   | Severidade       |  
|--------|-------------------------------------------------------------|------------------|  
| VWST-1 | Oracle assume uma proporção fixa de 1:1 entre stETH e ETH   | Low             |  
| VWST-2 | Oracle com múltiplos fallbacks não mitiga totalmente o risco de preço obsoleto | Low |  
| VWST-3 | Falta de validação de entrada                               | Low             |  
| VWST-4 | Aprimoramento da confiabilidade na conversão de stETH para wstETH | Informational |  
| VWST-5 | Parâmetro redundante                                        | Informational   |  
| VWST-6 | Uso de versão do Solidity com bugs conhecidos no compilador | Informational   |  

### GPT 4.o
| ID     | Descrição                                                   | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|--------|-------------------------------------------------------------|--------------------------|----------|--------------------------|
| VWST-1 | Oracle assume uma proporção fixa de 1:1 entre stETH e ETH   | High severity            | ✅       | VP (severidade incorreta) |
| VWST-2 | Oracle com múltiplos fallbacks não mitiga totalmente o risco de preço obsoleto | -  | ❌       | FN                         |
| VWST-3 | Falta de validação de entrada                               | -          |    ❌    | FN |
| VWST-4 | Aprimoramento da confiabilidade na conversão de stETH para wstETH | -      | ❌       | FN                         |
| VWST-5 | Parâmetro redundante                                        | -           | ❌       | FN                         |
| VWST-6 | Uso de versão do Solidity com bugs conhecidos no compilador |-           | ❌       | FN                         |
| -      | Dependência de Oracle Externa                               | High severity            | ❌       | FP                         |
| -      | Ausência de Validação no Retorno do Oracle                  | Medium severity          | ❌       | FP                         |
| -      | Uso de Revert com String Fixa                               | Medium severity          | ❌       | FP                         |
| -      | Falta de Eventos para Monitoramento                         | Low severity             | ❌       | FP                         |
| -      | Uso de `immutable` sem Necessidade Crítica                  | Informational            | ❌       | FP                         |
| -      | Falta de Comentários Explicativos nos Cálculos              | Informational            | ❌       | FP                         |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 6 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| VWST-1               |         High        |        Low          | **2**    |  

---

### DeepSeek-R1
| ID     | Descrição                                                   | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|--------|-------------------------------------------------------------|--------------------------|----------|--------------------------|
| VWST-1 | Oracle assume uma proporção fixa de 1:1 entre stETH e ETH   | High severity            | ✅       | VP (severidade incorreta) |
| VWST-2 | Oracle com múltiplos fallbacks não mitiga totalmente o risco de preço obsoleto | -  | ❌      | FN|
| VWST-3 | Falta de validação de entrada                               | -         | ❌       | FN                        |
| VWST-4 | Aprimoramento da confiabilidade na conversão de stETH para wstETH | -     | ❌       | FN                         |
| VWST-5 | Parâmetro redundante                                        |-           | ❌       | FN                         |
| VWST-6 | Uso de versão do Solidity com bugs conhecidos no compilador | -        | ❌       | FN                         |
| -      | Potential Decimal Scaling Mismatch                          | High severity            | ❌       | FP                         |
| -      | External Oracle Dependency                                  | Medium severity          | ❌       | FP                         |
| -      | Lack of Price Freshness Check                               | Medium severity          | ❌       | FP                         |
| -      | Inefficient Error Reporting                                 | Low severity             | ❌       | FP                         |
| -      | Centralized Dependency on External Contracts                | Informational            | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 5 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| VWST-1               |         High        |        Low          | **2**    |  

---

### llhama 3.3 
| ID     | Descrição                                                   | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|--------|-------------------------------------------------------------|--------------------------|----------|--------------------------|
| VWST-1 | Oracle assume uma proporção fixa de 1:1 entre stETH e ETH   | Low severity             | ✅       | VP                         |
| VWST-2 | Oracle com múltiplos fallbacks não mitiga totalmente o risco de preço obsoleto | - | ❌       | FN                         |
| VWST-3 | Falta de validação de entrada                               | Medium severity          | ✅       | VP (severidade incorreta) |
| VWST-4 | Aprimoramento da confiabilidade na conversão de stETH para wstETH | Informational      | ❌       | FN                         |
| VWST-5 | Parâmetro redundante                                        | Informational            | ❌       | FN                         |
| VWST-6 | Uso de versão do Solidity com bugs conhecidos no compilador | Informational            | ❌       | FN                         |
| -      | Reentrância                                                | High severity            | ❌       | FP                         |
| -      | Uso de funções não reentrantes                             | High severity            | ❌       | FP                         |
| -      | Uso de constantes mágicas                                  | Medium severity          | ❌       | FP                         |
| -      | Divisão por zero                                           | Medium severity          | ❌       | FP                         |
| -      | Performance                                                | Low severity             | ❌       | FP                         |
| -      | Gas                                                       | Low severity             | ❌       | FP                         |
| -      | Segurança do oráculo                                       | Undetermined             | ❌       | FP                         |
| -      | Integridade dos contratos dependentes                      | Undetermined             | ❌       | FP                         |
| -      | Documentação                                               | Informational            | ❌       | FP                         |
| -      | Testes                                                     | Informational            | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 10 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
|VWST-3               | Medium            | Low                | **1**    |  

---

### Gemini 2.0 Flash Thinking Experimental 01-21
| ID     | Descrição                                                   | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|--------|-------------------------------------------------------------|--------------------------|----------|--------------------------|
| VWST-1 | Oracle assume uma proporção fixa de 1:1 entre stETH e ETH   | Medium severity          | ✅       | VP (severidade incorreta) |
| VWST-2 | Oracle com múltiplos fallbacks não mitiga totalmente o risco de preço obsoleto | - | ❌       | FN                         |
| VWST-3 | Falta de validação de entrada                               | -                        | ❌       | FN                         |
| VWST-4 | Aprimoramento da confiabilidade na conversão de stETH para wstETH | -                  | ❌       | FN                         |
| VWST-5 | Parâmetro redundante                                        | -                        | ❌       | FN                         |
| VWST-6 | Uso de versão do Solidity com bugs conhecidos no compilador | -                        | ❌       | FN                         |
| -      | Dependência de Oráculo Externo                              | Medium severity          | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 1 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
|VWST-1               | Medium          | Low                 | **1**    |  
 


## Métricas Agregadas (WstETHOracle.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 15.32 |
| **DeepSeek-R1** | 128.94 |
| **Llama 3.3** | 6.69 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 10.06 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 6 | 5 | 0 |
| **DeepSeek-R1** | 1 | 5 | 5 | 0 |
| **Llama 3.3** | 2 | 10 | 4 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 1 | 1 | 5 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 2 | 1 | 2.00 |
| **DeepSeek-R1** | 2 | 1 | 2.00 |
| **Llama 3.3** | 1 | 2 | 0.50 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 1 | 1 | 1.00 |

