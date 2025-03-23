# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `LiquidatorStorage`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID   | Descrição                                                                          | Severidade       |
|------|----------------------------------------------------------------------------------|------------------|
| VEN-3 | Uso de versão vulnerável do Solidity                                           | Low              |

---

#### GPT-4o
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | -       | ❌         | FN                        |
| -    | Uninitialized Variables                         | High severity       | ❌       | FP                         |
| -    | Lacunas na Restrição de Acesso                 | High severity       | ❌       | FP                         |
| -    | Manipulação de Endereços em Mappings           | Medium severity     | ❌       | FP                         |
| -    | Armazenamento de Arrays Dinâmicos             | Medium severity     | ❌       | FP                         |
| -    | Uso de `uint256` para Flags Booleanas         | Low severity        | ❌       | FP                         |
| -    | Slot de Armazenamento Reservado (`__gap`)     | Informational      | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |


#### DeepSeek-R1
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | Infomational      | ✅       | VP (severidade errada)                        |
| -    | Exposição Pública de Variáveis de Estado      | Low severity        | ❌       | FP                         |
| -    | Falta de Validação de Entrada em Contratos Herdados | Undetermined       | ❌       | FP                         |
| -    | Atualizações Não-Triviais de `protocolShareReserve` | Undetermined       | ❌       | FP                         |
| -    | Gerenciamento de Storage para Upgrades        | Informational      | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 4 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

#### Erro de Classificação:
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|---------------------------|------------------------|-------------------------|  
| VEN-2            | Informational                    | Low | **1**    |  

---

#### Llama 3.3
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | Informational        | ✅       | VP (severidade errada)                        |
| -    | Reentrância em liquidationRestricted          | High severity       | ❌       | FP                         |
| -    | Manipulação de `treasuryPercentMantissa`       | High severity       | ❌       | FP                         |
| -    | Vulnerabilidades na gestão de `allowedLiquidatorsByAccount` | High severity  | ❌       | FP                         |
| -    | Unprotected Function                           | Medium severity     | ❌       | FP                         |
| -    | Integer Overflow em `treasuryPercentMantissa` ou `minLiquidatableVAI` | Medium severity | ❌       | FP                         |
| -    | Uso de `address[] public pendingRedeem`        | Medium severity     | ❌       | FP                         |
| -    | Inicialização de `pendingRedeemChunkLength`    | Low severity        | ❌       | FP                         |
| -    | Gap de Herança (`__gap`)                      | Low severity        | ❌       | FP                         |
| -    | Visibilidade e Controle de Acesso de Variáveis | Undetermined        | ❌       | FP                         |
| -    | Comentários e Documentação                    | Informational      | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 10 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

#### Erro de Classificação:
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|---------------------------|------------------------|-------------------------|  
| VEN-2            | Informational                    | Low | **1**    |  

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| VEN-3 | Uso de versão vulnerável do Solidity           | -        | ❌          | FN                         |
| -    | Falta de Validação de Entrada em `treasuryPercentMantissa` | Low severity     | ❌       | FP                         |
| -    | Crescimento Descontrolado do Mapeamento `allowedLiquidatorsByAccount` | Low severity     | ❌       | FP                         |
| -    | Risco de Configuração Incorreta em `liquidationRestricted` | Medium severity     | ❌       | FP                         |
| -    | Risco de Configuração Incorreta em `minLiquidatableVAI` | Medium severity     | ❌       | FP                         |
| -    | Risco de Configuração Incorreta em `forceVAILiquidate` | Medium severity     | ❌       | FP                         |
| -    | Crescimento Ilimitado do Array `pendingRedeem` | Medium severity     | ❌       | FP                         |
| -    | Falta de Validação do Endereço `protocolShareReserve` | Low severity     | ❌       | FP                         |
| -    | Variável Interna `pendingRedeemChunkLength` e Possível Impacto no Desempenho | Informational      | ❌       | FP                         |
| -    | Gap de Armazenamento `__gap` | Informational      | ❌       | FP                         |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |


## Métricas Agregadas (LiquidatorStorage.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 11.56 |
| **DeepSeek-R1** | 65.76 |
| **Llama 3.3** | 10.22 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 12.20 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 6 | 1 | 0 |
| **DeepSeek-R1** | 1 | 4 | 0 | 0 |
| **Llama 3.3** | 1 | 10 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 9 | 1 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 1 | 1 | 1.00 |
| **Llama 3.3** | 1 | 1 | 1.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

