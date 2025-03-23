# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `ICNR`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID          | Descrição                                   | Severidade  |
|-------------|---------------------------------------------|-------------|
| F-2023-0610 | Floating Pragma - Uso de pragma flutuante pode resultar na implantação com uma versão inesperada do compilador, potencialmente incluindo bugs. | Low |

---

### Análise por LLM
#### GPT-4o
| ID          | Descrição                                   | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-------------|---------------------------------------------|---------------------|----------|--------------------------|
| F-2023-0610 | Floating Pragma - Uso de pragma flutuante pode resultar na implantação com uma versão inesperada do compilador, potencialmente incluindo bugs. | -        | ❌       | FN                         |
| -    | Falta de Controle de Acesso em `changeBaseURI` | High severity       | ❌       | FP                         |
| -    | Possível Manipulação de `getNFTURI`            | Medium severity     | ❌       | FP                         |
| -    | Falta de Eventos para Mudanças de Estado       | Low severity        | ❌       | FP                         |
| -    | Falta de Documentação                          | Informational       | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1

| ID          | Descrição                                                                                                                                      | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- | -------- | --------------- |
| F-2023-0610 | Floating Pragma - Uso de pragma flutuante pode resultar na implantação com uma versão inesperada do compilador, potencialmente incluindo bugs. | Informational        | ✅       |  VP (Severidade errada)          |
| -           | Excessive Privileges in changeBaseURI Function                                                                                                 | High severity        | ❌        | FP              |
| -           | Missing Valid Contract Address Check in getNFTURI                                                                                              | Low severity         | ❌        | FP              |
| -           | Unspecified Behavior in ICNR Interface                                                                                                         | Undetermined         | ❌        | FP              |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 3 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| F-2023-0610              |     Informational           |   Low         | **1**    |  

---

#### Llama 3.3
| ID          | Descrição                                   | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-------------|---------------------------------------------|---------------------|----------|--------------------------|
| F-2023-0610 | Floating Pragma - Uso de pragma flutuante pode resultar na implantação com uma versão inesperada do compilador, potencialmente incluindo bugs. | -        | ❌      | FN                         |
| -    | Reentrância                                    | High severity       | ❌       | FP                         |
| -    | Uso de Funções Não Reentrantes                | High severity       | ❌       | FP                         |
| -    | Permissões Excessivas                         | Medium severity     | ❌       | FP                         |
| -    | Falta de Validações                           | Medium severity     | ❌       | FP                         |
| -    | Uso de Versão Específica do Compilador       | Low severity        | ❌       | FP                         |
| -    | Interface Não Implementada                   | Low severity        | ❌       | FP                         |
| -    | Comportamento em Casos de Exceção            | Undetermined        | ❌       | FP                         |
| -    | Licença                                      | Informational      | ❌       | FP                         |
| -    | Compatibilidade                              | Informational      | ❌       | FP                         |7

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                            | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)               |
|-----|------------------------------------------------|---------------------|----------|--------------------------|
| F-2023-0610 | Floating Pragma - Uso de pragma flutuante pode resultar na implantação com uma versão inesperada do compilador, potencialmente incluindo bugs. | - | ❌ | FN |
| -    | Falta de Controle de Acesso na Função `changeBaseURI` | High severity | ❌ | FP |
| -    | Chamada Externa Não Segura na Função `getNFTURI` | Medium severity | ❌ | FP |
| -    | Falta de Validação da URI Base em `changeBaseURI` | Medium severity | ❌ | FP |
| -    | Potencial Negação de Serviço (DoS) na Chamada Externa de `getNFTURI` | Low severity | ❌ | FP |
| -    | Confiança Implícita nos Dados Retornados por Contrato Externo em `getNFTURI` | Informational | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 5 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

---


## Métricas Agregadas (ICNR.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 28.53 |
| **DeepSeek-R1** | 16.31 |
| **Llama 3.3** | 8.04 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 9.27 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 4 | 1 | 0 |
| **DeepSeek-R1** | 1 | 3 | 0 | 0 |
| **Llama 3.3** | 0 | 9 | 1 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 5 | 1 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 1 | 1 | 1.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

