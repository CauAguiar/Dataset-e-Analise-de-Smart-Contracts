# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `ModuleAuth`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID      | Descrição                                                                | Severidade         |
|---------|--------------------------------------------------------------------------|--------------------|
| QSP-2   | Missing Return Values in Function isValidSignature in ModuleAuth        | Informational      |

---

### Análise por LLM

#### GPT-4o
| ID    | Descrição                                                                | Severidade Detectada    | Correta? | Tipo (VP/FP/FN)                  |
|-------|--------------------------------------------------------------------------|-------------------------|----------|---------------------------|
| QSP-2 | Falta de Verificação de Retorno em `isValidSignature`                    | High                    | ✅       | VP (severidade incorreta)|
| -     | Possível Ataque de Reentrância                                           | High                    | ❌       | FP                       |
| -     | Falta de Controle sobre `_isValidImage`                                  | Medium                  | ❌       | FP                       |
| -     | Uso de `chainid()` sem Proteção Contra Replay Attacks                    | Medium                  | ❌       | FP                       |
| -     | Uso de `recoverSigner` sem Proteção Contra Assinaturas Maliciosas        | Medium                  | ❌       | FP                       |
| -     | Possível Problema de Overflow/Underflow                                  | Low                     | ❌       | FP                       |
| -     | Falta de Emissão de Eventos para Ações Críticas                          | Low                     | ❌       | FP                       |
| -     | Comentários Desatualizados ou Ambíguos                                   | Informational           | ❌       | FP                       |
| -     | Uso de `abi.encodePacked` sem Delimitadores                              | Informational           | ❌       | FP                       |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 8 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| QSP-2                | High              | Informational                   | **3**    |  

#### DeepSeek-R1
| ID    | Descrição                                                        | Severidade Detectada    | Correta? | Tipo (VP/FP/FN)                  |
|-------|------------------------------------------------------------------|-------------------------|----------|----------------------------------|
| QSP-2 | Missing Return Values in Function isValidSignature               | -                   | ❌      | FN       |
| -     | Improper Signature Verification (Dependency)                     | High                    | ❌       | FP                               |
| -     | Incorrect Image Hash Validation                                  | High                    | ❌       | FP                               |
| -     | Dynamic Signature Denial-of-Service (DoS)                        | Medium                  | ❌       | FP                               |
| -     | Signature Parsing Vulnerabilities                                | Medium                  | ❌       | FP                               |
| -     | Outdated Solidity Version Use                                    | Low                     | ❌       | FP                               |
| -     | Dependence on Unverified Abstract Function                       | Undetermined            | ❌       | FP                               |
| -     | Non-Weighted Address Flags                                       | Informational           | ❌       | FP                               |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação

#### Llama 3.3
| ID    | Descrição                                        | Severidade Detectada | Correta? | Tipo (VP/FP/FN)                  |
|-------|------------------------------------------------|---------------------|----------|----------------------------------|
| QSP-2 | Missing Return Values in Function isValidSignature | -       | ❌       | FN                               |
| -     | Reentrância                                     | High                | ❌       | FP                               |
| -     | Uso Inseguro de Assembly                       | High                | ❌       | FP                               |
| -     | Falha na Validação de Parâmetros               | High                | ❌       | FP                               |
| -     | Uso de Primitivas Obsoletas                    | Medium              | ❌       | FP                               |
| -     | Dependência de Contratos Externos              | Medium              | ❌       | FP                               |
| -     | Gás Limit                                      | Medium              | ❌       | FP                               |
| -     | Visibilidade de Funções                        | Low                 | ❌       | FP                               |
| -     | Nomenclatura Confusa                           | Low                 | ❌       | FP                               |
| -     | Comportamento em Casos de Bordos               | Undetermined        | ❌       | FP                               |
| -     | Código Desorganizado                           | Informational       | ❌       | FP                               |
| -     | Uso de Bibliotecas Externas                    | Informational       | ❌       | FP                               |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 11 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID    | Descrição                                                        | Severidade Detectada | Correta? | Tipo (VP/FP/FN)                  |
|-------|------------------------------------------------------------------|---------------------|----------|----------------------------------|
| QSP-2 | Missing Return Values in Function isValidSignature               | -       | ❌       | FN                               |
| -     | Denial of Service (DoS) por Tamanho Dinâmico de Assinatura       | Medium              | ❌       | FP                               |
| -     | Vulnerabilidade a Ataque de Replay                               | Medium              | ❌       | FP                               |
| -     | Complexidade e Risco de Erro no Formato de Assinatura            | Low                 | ❌       | FP                               |
| -     | Ausência de Proteção contra Replay                               | Medium              | ❌       | FP                               |

Template:
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação


## Métricas Agregadas (ModuleAuth.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 10.36 |
| **DeepSeek-R1** | 91.66 |
| **Llama 3.3** | 17.74 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 9.81 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 8 | 0 | 0 |
| **DeepSeek-R1** | 0 | 7 | 1 | 0 |
| **Llama 3.3** | 0 | 11 | 1 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 1 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 3 | 1 | 3.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

