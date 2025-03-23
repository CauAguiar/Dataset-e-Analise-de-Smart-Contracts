# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `TrooperNFT`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
|----------|-----------------------------------------|---------------|

---

### Análise por LLM

#### GPT-4o
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo |
|--------------|--------------------------|--------------------------|----------|------|
| -          | Signature Replay Attack | High severity | ❌ | FP |
| -          | Lack of Event Emission | Medium severity | ❌ | FP |
| -          | Hardcoded Token ID in claimTrooper | Low severity | ❌ | FP |
| -          | Centralized Ownership Risks | Informational severity | ❌ | FP |
| -          | No Mechanism to Revoke Claims | Informational severity | ❌ | FP |
| -          | Dependency on External Signature Contract (`Signature.sol`) | Undetermined severity | ❌ | FP |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo |
|--------------|--------------------------|--------------------------|----------|------|
| -          | Verificação Inadequada de Assinatura (Signature Verification Flaw) | High severity | ❌ | FP |
| -          | Controle Centralizado de Mint (Owner Mint Privilege) | High severity | ❌ | FP |
| -          | Falta de Prevenção contra Replay Attacks | Medium severity | ❌ | FP |
| -          | Metadados Imutáveis (Fixed Metadata URI) | Low severity | ❌ | FP |
| -          | Ausência de Eventos Personalizados | Informational severity | ❌ | FP |
| -          | Riscos no Contrato `Signature` | Undetermined severity | ❌ | FP |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


#### Llama 3.3
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo |
|--------------|--------------------------|--------------------------|----------|------|
| -          | Reutilização de Assinaturas | High severity | ❌ | FP |
| -          | Controle de Acesso Inadequado | High severity | ❌ | FP |
| -          | Falta de Validação de Entradas | Medium severity | ❌ | FP |
| -          | Uso de Funções Não Reentrantes | Medium severity | ❌ | FP |
| -          | Exposição de Informações | Low severity | ❌ | FP |
| -          | Uso de Versão de Compilador Obsoleta | Low severity | ❌ | FP |
| -          | Comportamento da Função `verifyNFT` | Undetermined severity | ❌ | FP |
| -          | Uso de Bibliotecas Externas | Undetermined severity | ❌ | FP |
| -          | Licença do Código | Informational severity | ❌ | FP |
| -          | Comentários e Documentação | Informational severity | ❌ | FP |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo |
|--------------|--------------------------|--------------------------|----------|------|
| -          | Vulnerabilidade na Verificação de Assinatura | High severity | ❌ | FP |
| -          | Ataque de Replay Potencial na Função `claimTrooper` | Medium severity | ❌ | FP |
| -          | Falta de Validação de Input na Função `airdrop` | Informational severity | ❌ | FP |
| -          | Risco de Centralização (Função `Ownable`) | Informational severity | ❌ | FP |
| -          | Potencial Negação de Serviço (DoS) em `claimTrooper` | Low severity | ❌ | FP |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 5 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


## Métricas Agregadas (TrooperNFT.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 5.91 |
| **DeepSeek-R1** | 48.58 |
| **Llama 3.3** | 8.28 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 12.19 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 6 | 0 | 0 |
| **DeepSeek-R1** | 0 | 6 | 0 | 0 |
| **Llama 3.3** | 0 | 10 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 5 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

